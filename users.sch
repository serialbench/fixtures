<?xml version="1.0" encoding="UTF-8"?>
<!-- ISO Schematron for the canonical users fixture. Assertion style
     follows the ISO Schematron reference (http://purl.oclc.org/dsdl/
     schematron, pattern/rule/assert) as exercised in leptris
     test/sch. Kept small: the validation benchmark measures the
     query-eval cost per document, not schema complexity. -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern id="user-shape">
    <rule context="user">
      <assert test="@id">every user carries an id attribute</assert>
      <assert test="count(name) = 1 and count(email) = 1">user needs a name and an email</assert>
      <assert test="count(profile) = 1">user needs a profile</assert>
    </rule>
    <rule context="profile">
      <assert test="count(preferences) = 1">profile needs preferences</assert>
      <assert test="age >= 0">age must be non-negative</assert>
    </rule>
    <rule context="preferences">
      <assert test="theme = 'light' or theme = 'dark'">theme is light or dark</assert>
    </rule>
  </pattern>
</schema>
