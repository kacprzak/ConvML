<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <title>Schematron for ConvML</title>
  <ns prefix="conv" uri="http://www.entertech.com.pl/convml"/>
  <ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>

  <xsl:key name="routeSegmentKey" match="conv:RouteSegmentType" use="@typeId" />

  <pattern name="RouteSegment pattern">
    <rule context="conv:RouteSegmentType">
      <assert test="@length">RouteSegementType must have length</assert>
    </rule>
    <rule context="conv:RouteSegment[@type]">
      <assert test="not(@length)">
	RouteSegement with @type cannot redefine @length
      </assert>
      <!--report test="key('routeSegmentKey', @type)/@length">
	RouteSegment has length = <value-of select="key('routeSegmentKey', @type)/@length"/>
      </report-->
    </rule>
    <rule context="conv:RouteSegment[not(@type)]">
      <assert test="@length">
	RouteSegement must have length or reference to Type
      </assert>
    </rule>
  </pattern>

  <pattern name="RouteSection pattern">
    <rule context="conv:RouteSection[conv:RouteSegment]">
      <let name="segTypes" value="//conv:RouteSegmentType" />
      <let name="segments" value="conv:RouteSegment" />
      
      <!--report test="$segments">
	RouteSection length = <value-of select="@length"/>,
and sub-segments length = <value-of select="sum($segments/@length | $segments[$segTypes[@typeId = @type])"/>
      </report-->    
    </rule>
  </pattern>
</schema>