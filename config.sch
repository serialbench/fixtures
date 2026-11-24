<?xml version="1.0" encoding="UTF-8"?>
<!-- ISO Schematron for the canonical config fixture (small.xml and the
     small json/yaml/toml documents). Assertion style follows the ISO
     Schematron reference (http://purl.oclc.org/dsdl/schematron) as
     exercised in leptris test/sch. -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern id="config-shape">
    <rule context="database">
      <assert test="count(host) = 1 and count(port) = 1">database needs host and port</assert>
      <assert test="port > 0">port must be positive</assert>
    </rule>
    <rule context="cache">
      <assert test="count(enabled) = 1 and count(ttl) = 1">cache needs enabled and ttl</assert>
      <assert test="ttl >= 0">ttl must be non-negative</assert>
    </rule>
  </pattern>
</schema>
