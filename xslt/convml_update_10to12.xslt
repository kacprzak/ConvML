<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ren="http://entertech.com.pl/xslt/rename">
  
  <xsl:import href="table_driven_rename.xslt" />
  
  <!-- Tabela wyszukiwania -->
  <xsl:variable name="lookup" select="document('')/*[ren:*]" />
  
  <!-- Reguly zmiany nazw -->
  <ren:element from="CONVML" to="ConvML" />
  <ren:element from="CONDITIONS" to="Conditions" />
  <ren:element from="MATERIAL" to="Material" />
  <ren:element from="BELT_CONVEYOR" to="BeltConveyor" />
  <ren:element from="BELT" to="Belt" />
  <ren:element from="ROUTE" to="Route" />
  <ren:element from="HEAD" to="Head" />
  <ren:element from="TAIL" to="Tail" />
  <ren:element from="BELT_SEGMENT" to="BeltSegment" />
  <ren:element from="BELT_SPLICING" to="BeltSplice" />	<!-- ! -->
  <ren:element from="CARRY" to="Carry" />
  <ren:element from="RETURN" to="Return" />
  <ren:element from="IDLER_SET" to="IdlerSet" />
  <ren:element from="IDLER" to="Idler" />
  <ren:element from="CHUTE" to="Chute" />
  <ren:element from="PULLEY" to="Pulley" />
  <ren:element from="CONV_ELECTRICAL_EQUIPMENT" to="ConvElectricalEquipment" />
  <ren:element from="ELECTRICAL_EQUIPMENT" to="ElectricalEquipment" />
  <ren:element from="TT_DRIVE" to="TTDrive" />
  <ren:element from="COOLING_SYSTEM" to="CoolingSystem" />
  <ren:element from="TAKEUP_SYSTEM" to="TakeUpSystem" />
  <ren:element from="ADD_EQUIPMENT" to="AdditionalEquipment" />	<!-- ! -->
  <ren:element from="CLEAN_EQUIPMENT" to="CleaningDevice" />	<!-- ! -->
  <ren:element from="ROUTE_SECTION" to="RouteSection" />
  <ren:element from="IDLER_SET_SPECIAL" to="IdlerSetSpecial" />
  <ren:element from="SLIP_PLATE" to="SlipPlate" />
  <ren:element from="MOTOR" to="Motor" />
  <ren:element from="COUPLING" to="Coupling" />
  <ren:element from="BRAKE" to="Brake" />
  <ren:element from="FLUID_COUPLING" to="FluidCoupling" />
  <ren:element from="GEARBOX" to="Gearbox" />
  <ren:element from="BEARING" to="Bearing" />
  <ren:element from="STRECHING_CAR" to="StrechingCar" />
  <ren:element from="ROPE_SYSTEM" to="RopeSystem" />
  <ren:element from="WINCH" to="Winch" />
  <ren:element from="GRAVITY_SYSTEM" to="GravitySystem" />
  <ren:element from="HYDRAULIC_SYSTEM" to="HydraulicSystem" />
  <ren:element from="PNEUMATIC_SYSTEM" to="PneumaticSystem" />
  <ren:element from="CONTROL_SYSTEM" to="ControlSystem" />
  <ren:element from="EMERGENCY_SYSTEM" to="EmergencySystem" />
  <ren:element from="SIGNAL_SYSTEM" to="SignalSystem" />
  <ren:element from="FIRE_SYSTEM" to="FireSystem" />
  <ren:element from="DRIVE_UNIT" to="DriveUnit" />
  <ren:element from="ROUTE_SEGMENT" to="RouteSegment" />
  <ren:element from="UNLOAD" to="Unload" />
  <ren:element from="COUNTERWEIGHT" to="Counterweight" />
</xsl:stylesheet>