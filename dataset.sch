<?xml version="1.0" encoding="UTF-8"?>
<!-- ISO Schematron for the canonical dataset fixture (large.xml and the
     large json/yaml/toml documents). Assertion style follows the ISO
     Schematron reference (http://purl.oclc.org/dsdl/schematron) as
     exercised in leptris test/sch. -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern id="dataset-shape">
    <rule context="header">
      <assert test="count > 0">dataset header must claim a positive count</assert>
    </rule>
    <rule context="record">
      <assert test="@id">every record carries an id attribute</assert>
      <assert test="count(data) = 1 and count(metadata) = 1">record needs data and metadata</assert>
    </rule>
    <rule context="data">
      <assert test="count(nested/item) >= 1">data carries at least one nested item</assert>
    </rule>
  </pattern>
</schema>
