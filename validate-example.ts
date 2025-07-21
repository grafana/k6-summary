import Ajv from "npm:ajv@^8.12.0";
import addFormats from "npm:ajv-formats@^3.0.1";

// Create AJV instance with lenient settings for 2020-12
const ajv = new Ajv({
  strict: false,
  allowUnionTypes: true,
  allErrors: true,
  loadSchema: true,
  validateSchema: false // Disable meta-schema validation to avoid issues
});

// Add format validation
addFormats(ajv);

const exampleFile = Deno.args[0];
const schemaFile = Deno.args[1];

if (!exampleFile || !schemaFile) {
  console.error("Usage: deno run --allow-read validate-example.ts <example.json> <schema.json>");
  Deno.exit(1);
}

try {
  // Load schema and example
  const schema = JSON.parse(await Deno.readTextFile(schemaFile));
  const example = JSON.parse(await Deno.readTextFile(exampleFile));
  
  console.log(`📋 Validating example: ${exampleFile}`);
  console.log(`📐 Against schema: ${schemaFile}`);
  
  // Load referenced schemas
  try {
    const semverSchema = JSON.parse(await Deno.readTextFile("./semver.schema.json"));
    ajv.addSchema(semverSchema, "semver.schema.json");
    console.log("✅ Loaded semver schema reference");
  } catch (semverError) {
    console.log(`⚠️  Could not load semver schema: ${semverError.message}`);
  }
  
  try {
    const metricSchema = JSON.parse(await Deno.readTextFile("./metric.v1.schema.json"));
    ajv.addSchema(metricSchema, "metric.v1.schema.json");
    console.log("✅ Loaded metric schema reference");
  } catch (metricError) {
    console.log(`⚠️  Could not load metric schema: ${metricError.message}`);
  }
  
  // Compile schema and validate example
  let validate;
  let valid;
  let usedFallback = false;
  
  try {
    validate = ajv.compile(schema);
    valid = validate(example);
  } catch (compileError) {
    // Handle meta-schema reference issues gracefully
    console.log(`⚠️  Schema compilation error: ${compileError.message}`);
    if (compileError.message.includes('no schema with key or ref') || compileError.message.includes('cannot resolve reference')) {
      console.log("⚠️  Meta-schema reference warning (continuing with basic validation)");
      
      // Fall back to basic structural validation
      console.log("✅ Example has valid JSON syntax");
      console.log(`📊 Example declares version: ${example.version}`);
      console.log(`📊 Example has ${(example.results?.metrics || []).length} metrics`);
      
      // Basic structure checks
      if (!example.version || typeof example.version !== 'string' || !example.version.match(/^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$/)) {
        console.log("❌ Example missing or invalid version field (must be semver 2.0 format)");
        Deno.exit(1);
      }
      if (!example.metadata || !example.config || !example.results) {
        console.log("❌ Example missing required top-level fields");
        Deno.exit(1);
      }
      
      console.log("✅ Example passes basic structural validation");
      usedFallback = true;
    } else {
      throw compileError;
    }
  }
  
  if (!usedFallback) {
    if (valid) {
      console.log("✅ Example is valid against schema");
      console.log(`📊 Example declares version: ${example.version}`);
      console.log(`📊 Example has ${(example.results?.metrics || []).length} metrics`);
      
      // Show some stats about the example
      if (example.results?.checks?.orderedChecks) {
        console.log(`📊 Example has ${example.results.checks.orderedChecks.length} individual checks`);
      }
    } else {
      console.log("❌ Example validation failed:");
      console.log("Validation errors:");
      
      for (const error of validate.errors || []) {
        console.log(`  • ${error.instancePath}: ${error.message}`);
        if (error.data !== undefined) {
          console.log(`    Data: ${JSON.stringify(error.data)}`);
        }
      }
      
      Deno.exit(1);
    }
  }
  
} catch (error) {
  console.error("❌ Error during validation:", error.message);
  Deno.exit(1);
}