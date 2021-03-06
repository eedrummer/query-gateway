require 'test_helper'

class EncounterImporterApiTest < ImporterApiTest
  def test_encounter_importing
    assert_equal 1, @context.eval('patient.encounters().length')
    assert @context.eval('patient.encounters().match({"CPT": ["99241"]}).length != 0')
    assert_equal 'Dr. Kildare', @context.eval('patient.encounters()[0].performer().person().name()')
    assert_equal 'Good Health Clinic', @context.eval('patient.encounters()[0].facility().organizationName()')
    assert @context.eval('patient.encounters()[0].reasonForVisit().includesCodeFrom({"SNOMED-CT": ["308292007"]})')
    assert @context.eval('patient.encounters()[0].admitType().includedIn({"CPT": ["xyzzy"]})')
    assert_equal 2000, @context.eval('patient.encounters()[0].date().getUTCFullYear()')
    assert_equal 3, @context.eval('patient.encounters()[0].date().getUTCMonth()')
    assert_equal 7, @context.eval('patient.encounters()[0].date().getUTCDate()')
  end
end