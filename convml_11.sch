<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	queryBinding="xslt2">
  <title>Schematron for ConvML</title>
  <ns prefix="conv" uri="http://www.entertech.com.pl/convml"/>
  <ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>

  <xsl:key name="routeSegmentKey" match="conv:RouteSegmentType" use="@typeId" />

  <pattern name="RouteSegment pattern">
    <rule context="conv:RouteSegmentType">
      <assert test="@length">RouteSegementType must have length.</assert>
    </rule>

    <rule context="conv:RouteSegment[@type]">
      <assert test="not(@length)">
	RouteSegement with @type cannot redefine @length.
      </assert>
    </rule>

    <rule context="conv:RouteSegment[not(@type)]">
      <assert test="@length">
	RouteSegement must have length or reference to Type.
      </assert>
    </rule>
  </pattern>

  <pattern name="RouteSection pattern">
    <rule context="conv:RouteSection[conv:RouteSegment]">
      <let name="segTypes" value="//conv:RouteSegmentType" />
      <let name="subSegLength" value="sum(
				      for $x in conv:RouteSegment
				      return if ($x/@length)
				      then $x/@length
				      else $segTypes[@typeId = $x/@type]/@length)
				      "/>
      
      <assert test="number(@length) ge number($subSegLength)">
	RouteSection length = <value-of select="@length"/> is smaller than sub-segments length = <value-of select="$subSegLength"/>.
      </assert>
      <assert test="not(@segmentType)">
	RouteSection with sub-elements cannot have segmentType attribute.
      </assert>
    </rule>

    <rule context="conv:RouteSection[@segmentType]">
      <assert test="count(conv:RouteSegement) = 0">
	RouteSection with segmentType attribute cannot have sub-segments.
      </assert>
      <assert test="number(@length) ge number(key('routeSegmentKey', @segmentType)/@length)">
	RouteSection cannot have sub-segment longer than the section itself.
      </assert>
    </rule>
  </pattern>
</schema>