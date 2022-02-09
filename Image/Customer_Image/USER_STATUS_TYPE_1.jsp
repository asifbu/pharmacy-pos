<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="USER_STATUS_TYPE_1" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="MODULE2" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <data>
    <dataSource name="Q_1">
      <select>
      <![CDATA[select user_status_id,user_status_name
from user_status
order by user_status_id]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_user_status_id">
        <displayInfo x="1.08435" y="1.94995" width="1.83142" height="0.61963"
        />
        <dataItem name="user_status_id" oracleDatatype="number"
         columnOrder="11" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="33" defaultLabel="User Status ID">
          <dataDescriptor expression="user_status_id"
           descriptiveExpression="USER_STATUS_ID" order="1" width="22"
           scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="user_status_name" datatype="vchar2" columnOrder="12"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="User Status Name">
          <dataDescriptor expression="user_status_name"
           descriptiveExpression="USER_STATUS_NAME" order="2" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body height="9.12500">
      <location y="0.25000"/>
      <frame name="M_G_user_status_id_GRPFR">
        <geometryInfo x="0.00000" y="0.50000" width="7.50000" height="0.93750"
        />
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_user_status_id" source="G_user_status_id"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.87500" width="7.50000"
           height="0.25000"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings linePattern="solid"/>
          <field name="F_user_status_id" source="user_status_id"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="10"/>
            <geometryInfo x="0.75000" y="0.87500" width="1.18750"
             height="0.25000"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_user_status_name" source="user_status_name"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="10"/>
            <geometryInfo x="3.93750" y="0.87500" width="3.56250"
             height="0.25000"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
        </repeatingFrame>
        <frame name="M_G_user_status_id_HDR">
          <geometryInfo x="0.00000" y="0.62500" width="7.50000"
           height="0.25000"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings linePattern="solid"/>
          <text name="B_user_status_id" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.75000" y="0.62500" width="1.18750"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="10"/>
              <string>
              <![CDATA[User Status ID]]>
              </string>
            </textSegment>
          </text>
          <text name="B_user_status_name" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="3.93750" y="0.62500" width="3.56250"
             height="0.25000"/>
            <textSegment>
              <font face="Courier New" size="10"/>
              <string>
              <![CDATA[User Status Name]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
    </body>
  </section>
  </layout>
  <reportPrivate defaultReportType="tabular" versionFlags2="0" templateName=""
  />
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 9i Reports Developer"/>
<title> Your Title </title>

<rw:style id="yourStyle">
   <!-- Report Wizard inserts style link clause here -->
</rw:style>

</head>


<body>

<rw:dataArea id="yourDataArea">
   <!-- Report Wizard inserts the default jsp here -->
</rw:dataArea>



</body>
</html>

<!--
</rw:report> 
-->
