<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="MODULE2" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="MODULE2" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <data>
    <userParameter name="P_START_DATE" datatype="character" width="40"
     defaultWidth="0" defaultHeight="0"/>
    <userParameter name="P_END_DATE" datatype="character" width="40"
     defaultWidth="0" defaultHeight="0"/>
    <dataSource name="Q_1">
      <select>
      <![CDATA[select distinct sales_quantity_f(sales_details.item_id,:p_start_date,:p_end_date)sales_quantity,
      
        
         item.item_name,item_company.item_company_name,item.item_id
from   sales_details,item,item_company
where  sales_details.item_id=item.item_id(+)
and      item.item_company_id=item_company.item_company_id(+)
order by item.item_id]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_item_name">
        <displayInfo x="1.12097" y="1.94995" width="1.75818" height="1.96875"
        />
        <dataItem name="item_id" oracleDatatype="number" columnOrder="16"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Item Id">
          <dataDescriptor expression="item.item_id"
           descriptiveExpression="ITEM_ID" order="4" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="item_company_name" datatype="vchar2" columnOrder="15"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Item Company Name">
          <dataDescriptor expression="item_company.item_company_name"
           descriptiveExpression="ITEM_COMPANY_NAME" order="3" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="item_name" datatype="vchar2" columnOrder="14"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Sales Quantity">
          <xmlSettings xmlTag="SALES_QUANTITY"/>
          <dataDescriptor expression="item.item_name"
           descriptiveExpression="ITEM_NAME" order="2" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="sales_quantity1" oracleDatatype="number"
         columnOrder="13" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Sales Quantity F Sales Details">
          <xmlSettings xmlTag="SALES_QUANTITY_F_SALES_DETAILS"/>
          <dataDescriptor
           expression="sales_quantity_f ( sales_details.item_id , : p_start_date , : p_end_date )"
           descriptiveExpression="SALES_QUANTITY" order="1"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <formula name="CF_1" source="cf_1formula" datatype="number" width="20"
         precision="10" defaultWidth="120000" defaultHeight="10000"
         columnFlags="16" defaultLabel="Cf 1" breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
        <formula name="sales_total" source="sales_totalformula"
         datatype="number" width="20" precision="10" defaultWidth="120000"
         defaultHeight="10000" columnFlags="16" defaultLabel="Sales Total"
         breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
      </group>
    </dataSource>
    <summary name="Sumsales_quantity1PerReport" source="sales_quantity1"
     function="sum" width="22" precision="38" reset="report" compute="report"
     defaultWidth="90000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Total:">
      <displayInfo x="0.91675" y="0.01038" width="1.67700" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body width="8.18750">
      <location x="0.18750" y="0.37500"/>
      <frame name="M_G_item_name_GRPFR">
        <geometryInfo x="0.00000" y="0.43750" width="8.14050" height="0.87500"
        />
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_item_name" source="G_item_name"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.75000" width="8.14050"
           height="0.31250"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings linePattern="solid"/>
          <field name="F_item_name" source="item_name" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="Tahoma" size="8"/>
            <geometryInfo x="0.06250" y="0.81250" width="2.56250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_sales_quantity1" source="sales_quantity1"
           minWidowLines="1" formatMask="99,99,99,999.99" spacing="0"
           alignment="end">
            <font face="Tahoma" size="8"/>
            <geometryInfo x="7.12500" y="0.81250" width="0.95300"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_item_name1" source="CF_1" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="Tahoma" size="8"/>
            <geometryInfo x="2.68750" y="0.81250" width="2.75000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <line name="B_3" arrow="none" stretchWithFrame="R_G_item_name">
            <geometryInfo x="2.62500" y="0.43750" width="0.00000"
             height="0.62500"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <points>
              <point x="2.62500" y="0.43750"/>
              <point x="2.62500" y="1.06250"/>
            </points>
          </line>
          <line name="B_4" arrow="none" stretchWithFrame="R_G_item_name">
            <geometryInfo x="7.12500" y="0.43750" width="0.00000"
             height="0.62500"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <points>
              <point x="7.12500" y="0.43750"/>
              <point x="7.12500" y="1.06250"/>
            </points>
          </line>
          <field name="F_sales_quantity2" minWidowLines="1"
           formatMask="99,99,99,999.99" spacing="0" alignment="end">
            <font face="Tahoma" size="8"/>
            <geometryInfo x="5.43750" y="0.81250" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <line name="B_2" arrow="none" stretchWithFrame="R_G_item_name">
            <geometryInfo x="5.43750" y="0.43750" width="0.00000"
             height="0.62500"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <points>
              <point x="5.43750" y="0.43750"/>
              <point x="5.43750" y="1.06250"/>
            </points>
          </line>
          <field name="F_sales_quantity3" minWidowLines="1"
           formatMask="99,99,999.99" spacing="0" alignment="end">
            <font face="Tahoma" size="8"/>
            <geometryInfo x="6.31250" y="0.81250" width="0.75000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <line name="B_5" arrow="none" stretchWithFrame="R_G_item_name">
            <geometryInfo x="6.31250" y="0.43750" width="0.00000"
             height="0.62500"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <points>
              <point x="6.31250" y="0.43750"/>
              <point x="6.31250" y="1.06250"/>
            </points>
          </line>
        </repeatingFrame>
        <frame name="M_G_item_name_FTR">
          <geometryInfo x="0.00000" y="1.12500" width="8.07800"
           height="0.18750"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <field name="F_Sumsales_quantity1PerReport"
           source="Sumsales_quantity1PerReport" minWidowLines="1"
           formatMask="99,99,99,999.99" spacing="0" alignment="end">
            <font face="Tahoma" size="8" bold="yes"/>
            <geometryInfo x="6.64050" y="1.12500" width="1.43750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <text name="B_Total_" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="1.12500" width="0.56250"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="10" bold="yes"/>
              <string>
              <![CDATA[Total:]]>
              </string>
            </textSegment>
          </text>
        </frame>
        <frame name="M_G_item_name_HDR">
          <geometryInfo x="0.00000" y="0.43750" width="8.14050"
           height="0.31250"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings linePattern="solid"/>
          <text name="B_item_name" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.06250" y="0.50000" width="0.81250"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="8" bold="yes"/>
              <string>
              <![CDATA[Item Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_sales_quantity1" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="7.14050" y="0.50000" width="1.00000"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="8" bold="yes"/>
              <string>
              <![CDATA[Sales Total]]>
              </string>
            </textSegment>
          </text>
          <line name="B_1" arrow="none">
            <geometryInfo x="0.70300" y="0.75000" width="7.43750"
             height="0.00000"/>
            <visualSettings linePattern="solid" lineForegroundColor="r50g0b0"/>
            <points>
              <point x="0.70300" y="0.75000"/>
              <point x="8.14050" y="0.75000"/>
            </points>
          </line>
          <text name="B_item_name1" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="2.68750" y="0.50000" width="2.75000"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="8" bold="yes"/>
              <string>
              <![CDATA[Company Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_item_name2" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="5.43750" y="0.50000" width="0.87500"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="8" bold="yes"/>
              <string>
              <![CDATA[Free Total]]>
              </string>
            </textSegment>
          </text>
          <text name="B_item_name3" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="6.31250" y="0.50000" width="0.81250"
             height="0.18750"/>
            <textSegment>
              <font face="Tahoma" size="8" bold="yes"/>
              <string>
              <![CDATA[Bonus Total]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
    </body>
  </section>
  </layout>
  <programUnits>
    <function name="sales_totalformula" returnType="number">
      <textSource>
      <![CDATA[function sales_totalFormula return Number is
begin
  return:sales_quantity1+:sales_free_quantity+:sales_bonus_quantity;
end;]]>
      </textSource>
    </function>
    <function name="cf_1formula" returnType="number">
      <textSource>
      <![CDATA[function CF_1Formula 
return Number is
v_purchase_total       number;
begin
  select sum(nvl(purchase_quantity,0))
  into    v_purchase_total
  from    purchase_details,purchase_master,item
  where   purchase_details.purchase_master_id=purchase_master.purchase_master_id
  and     purchase_details.item_id=purchase_details.item_id
  and     item.item_id=purchase_details.item_id
 
  and     purchase_master.purchase_master_date between :p_start_date and :p_end_date;
  return v_purchase_total;
end;]]>
      </textSource>
    </function>
  </programUnits>
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



</head>


<body>

<!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGitemnameGRPFR134">
<table>
<caption>  </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBitemname134" asArray="no"/>> Sales Quantity </th>
   <th <rw:id id="HBsalesquantity1134" asArray="no"/>> Sales Quantity F Sales Details </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RGitemname1341" src="G_item_name">
   <tr>
    <td <rw:headers id="HFitemname134" src="HBitemname134"/>><rw:field id="Fitemname134" src="item_name" nullValue="&nbsp;"> F_item_name </rw:field></td>
    <td <rw:headers id="HFsalesquantity1134" src="HBsalesquantity1134"/>><rw:field id="Fsalesquantity1134" src="sales_quantity1" nullValue="&nbsp;"> F_sales_quantity1 </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
 <!-- Report Level Summary -->
 <tr>
  <th> &nbsp; </th>
  <td <rw:headers id="HFSumsalesquantity1PerReport134" src="HBsalesquantity1134"/>>Total: <rw:field id="FSumsalesquantity1PerReport134" src="Sumsales_quantity1PerReport" nullValue="&nbsp;"> F_Sumsales_quantity1PerReport </rw:field></td>
 </tr>
</table>
</rw:dataArea> <!-- id="MGitemnameGRPFR134" -->
<!-- End of Data Area Generated by Reports Developer -->




</body>
</html>

<!--
</rw:report> 
-->
