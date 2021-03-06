# This file is used to load enhancements to the Quality Measure Engine for full C32
# importing

require 'ext/string' # freedom patch to String to allow boolean conversion

require 'importer/core_importer'
require 'importer/extended_entry'
require 'importer/result'
require 'importer/result_importer'
require 'importer/immunization'
require 'importer/immunization_importer'
require 'importer/order_information'
require 'importer/fulfillment_history'
require 'importer/medication'
require 'importer/medication_importer'
require 'importer/encounter'
require 'importer/encounter_importer'
require 'importer/vital_sign_importer'
require 'importer/allergy'
require 'importer/allergy_importer'
require 'importer/procedure'
require 'importer/procedure_importer'

pi = QME::Importer::PatientImporter.instance

# Crack open the PI and replace the result importer... slightly evil
pi.instance_eval do
  @section_importers[:results] = Importer::ResultImporter.new
  @section_importers[:immunizations] = Importer::ImmunizationImporter.new
  @section_importers[:medications] = Importer::MedicationImporter.new
  @section_importers[:encounters] = Importer::EncounterImporter.new
  @section_importers[:vital_signs] = Importer::VitalSignImporter.new
  @section_importers[:allergies] = Importer::AllergyImporter.new
  @section_importers[:procedures] = Importer::ProcedureImporter.new
end

QME::Importer::CodeSystemHelper::CODE_SYSTEMS["2.16.840.1.113883.5.83"] = "HITSP C80 Observation Status"

