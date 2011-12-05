<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>Schematron for ConvML</title>
  <ns prefix="conv" uri="http://www.entertech.com.pl/convml"/>
  <pattern>
    <rule context="conv:RouteSegmentType">
      <assert test="@length">RouteSegementType must have length</assert>
    </rule>
    <rule context="conv:RouteSegment">
      <assert test="@length or @type">RouteSegement must have length or reference to Type</assert>
    </rule>
  </pattern>
</schema>