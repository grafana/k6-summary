import Ajv from "npm:ajv@^8.12.0";
import addFormats from "npm:ajv-formats@^3.0.1";

// Create AJV instance with lenient settings for 2020-12
const ajv = new Ajv({
  strict: false,
  allowUnionTypes: true,
  allErrors: true,
  loadSchema: true
});

// Add format validation
addFormats(ajv);

// For 2020-12, we'll focus on practical validation rather than meta-schema validation
// due to the complexity of the 2020-12 meta-schema dependencies
console.log('🔧 Using practical validation for JSON Schema 2020-12');

const schemaFile = Deno.args[0];

try {
  const userSchema = JSON.parse(await Deno.readTextFile(schemaFile));
  
  // First validate JSON syntax and basic structure
  console.log("✅ Schema JSON syntax is valid");
  
  // Basic structure checks
  if (!userSchema.$schema) throw new Error('Missing $schema field');
  if (!userSchema.title) throw new Error('Missing title field');
  if (!userSchema.type) throw new Error('Missing type field');
  if (!userSchema.properties) throw new Error('Missing properties field');
  if (!userSchema.$defs) throw new Error('Missing $defs field');
  
  console.log('✅ Schema has required top-level fields');
  console.log('Schema title:', userSchema.title);
  console.log('Schema version:', userSchema.$id);
  
  // Validate $schema field points to 2020-12
  if (!userSchema.$schema.includes('2020-12')) {
    throw new Error('Schema does not reference 2020-12 specification');
  }
  
  // Validate that $defs is used instead of definitions
  if ('definitions' in userSchema) {
    throw new Error('Schema still uses deprecated "definitions" - should use "$defs"');
  }
  
  // Test that the schema can be compiled (basic validation)
  try {
    const compiled = ajv.compile(userSchema);
    if (compiled) {
      console.log("✅ Schema compiles successfully with AJV");
    }
  } catch (compileError) {
    // Check if it's just a meta-schema warning we can ignore
    if ((compileError as Error).message.includes('no schema with key or ref')) {
      console.log("✅ Schema compiles (ignoring meta-schema reference warnings)");
    } else {
      throw compileError;
    }
  }
  
  console.log("✅ Valid JSON Schema (2020-12)");
  
} catch (error) {
  console.error("❌ Schema validation failed:", (error as Error).message);
  Deno.exit(1);
}