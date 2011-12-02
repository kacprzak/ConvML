<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>Schematron for ConvML</title>
  <ns prefix="conv" uri="http://www.entertech.com.pl/convml"/>
  <pattern>
    <rule context="conv:ConvML">
      <assert test="conv:BeltConveyor">ConvML should contain BeltConveyor.</assert>
    </rule>
  </pattern>
</schema>