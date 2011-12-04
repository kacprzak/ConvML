<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>Schematron for ConvML</title>
  <ns prefix="conv" uri="http://www.entertech.com.pl/convml"/>
  <pattern>
    <rule context="conv:RouteSegmentType">
      <assert test="@length">RouteSegementType must have length</assert>
    </rule>
  </pattern>
</schema>