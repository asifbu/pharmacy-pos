<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="SALES_INVOICE" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="SALES_INVOICE" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforeReportHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
</head>
<body bgcolor="#ffffff">

]]>
    </beforeReportHtmlEscape>
    <afterPageHtmlEscape>
    <![CDATA[<hr size=5 noshade>
]]>
    </afterPageHtmlEscape>
    <beforeFormHtmlEscape>
    <![CDATA[<html dir=&Direction>
<body bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
]]>
    </beforeFormHtmlEscape>
    <pageNavigationHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
<TITLE>Oracle HTML Navigator</TITLE>
<SCRIPT type="text/javascript" LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" action="" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM>
</body></html>]]>
    </pageNavigationHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <userParameter name="P_INVOICE" datatype="character" width="40"
     defaultWidth="0" defaultHeight="0"/>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL CUSTOMER.CUSTOMER_ID, SALES_MASTER.SALES_MASTER_ID, SALES_DETAILS.SALES_DETAILS_ID, SALES_DETAILS.ITEM_ID, 
SALES_MASTER.SALES_INVOICE, SALES_MASTER.SALES_MASTER_DATE, 
SALES_MASTER.SALES_MASTER_TOTAL_PRICE, SALES_MASTER.SALES_MASTER_DISCOUNT, SALES_MASTER.SALES_MASTER_GRAND_TOTAL, 
SALES_MASTER.SALES_MASTER_PAY, SALES_MASTER.SALES_MASTER_DUE, SALES_DETAILS.ITEM_UNIT_ID, ITEM.ITEM_ID, ' '||ITEM.ITEM_NAME item_name, 
CUSTOMER.CUSTOMER_first_name||' '||Customer_last_name Customer_Name, CUSTOMER.CUSTOMER_ADDRESS, CUSTOMER.CUSTOMER_CELL_NUMBER1,SALES_DETAILS.SALES_QUANTITY,SALES_DETAILS.UNIT_PRICE,SALES_DETAILS.SALES_QUANTITY*SALES_DETAILS.UNIT_PRICE ITTEM_TOTAL,
CUSTOMER.CUSTOMER_CELL_NUMBER2, CUSTOMER.CUSTOMER_CODE,item_unit_name,sales_master.action_date,sales_master.action_user
FROM CUSTOMER, ITEM, SALES_MASTER, SALES_DETAILS,item_unit

WHERE ((SALES_MASTER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID)
 AND (SALES_DETAILS.SALES_MASTER_ID = SALES_MASTER.SALES_MASTER_ID)
 AND (SALES_DETAILS.ITEM_ID = ITEM.ITEM_ID)) 
and SALES_INVOICE=:P_Invoice
and   item_unit.item_unit_id=sales_details.item_unit_id
and sales_quantity>0
ORDER BY SALES_DETAILS.SALES_DETAILS_ID]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_CUSTOMER_ID">
        <displayInfo x="0.90125" y="1.94995" width="2.19763" height="1.45605"
        />
        <dataItem name="CUSTOMER_ID" oracleDatatype="number" columnOrder="12"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Customer Id">
          <dataDescriptor expression="CUSTOMER.CUSTOMER_ID"
           descriptiveExpression="CUSTOMER_ID" order="1"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_ID" oracleDatatype="number"
         columnOrder="13" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Sales Master Id">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_ID"
           descriptiveExpression="SALES_MASTER_ID" order="2"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_DATE" datatype="date"
         oracleDatatype="date" columnOrder="17" width="9" defaultWidth="90000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Sales Master Date">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_DATE"
           descriptiveExpression="SALES_MASTER_DATE" order="6"
           oracleDatatype="date" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="Customer_Name" datatype="vchar2" columnOrder="41"
         width="201" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Customer Name">
          <dataDescriptor
           expression="CUSTOMER.CUSTOMER_first_name || &apos; &apos; || Customer_last_name"
           descriptiveExpression="CUSTOMER_NAME" order="15" width="201"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="action_date" datatype="date" oracleDatatype="date"
         columnOrder="34" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Action Date">
          <dataDescriptor expression="sales_master.action_date"
           descriptiveExpression="ACTION_DATE" order="24"
           oracleDatatype="date" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="action_user" datatype="vchar2" columnOrder="35"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Action User">
          <dataDescriptor expression="sales_master.action_user"
           descriptiveExpression="ACTION_USER" order="25" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_INVOICE" datatype="vchar2" columnOrder="16"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Sales Invoice">
          <dataDescriptor expression="SALES_MASTER.SALES_INVOICE"
           descriptiveExpression="SALES_INVOICE" order="5" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_PAY" oracleDatatype="number"
         columnOrder="21" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Sales Master Pay">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_PAY"
           descriptiveExpression="SALES_MASTER_PAY" order="10"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_DUE" oracleDatatype="number"
         columnOrder="22" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Sales Master Due">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_DUE"
           descriptiveExpression="SALES_MASTER_DUE" order="11"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_DISCOUNT" oracleDatatype="number"
         columnOrder="19" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Sales Master Discount">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_DISCOUNT"
           descriptiveExpression="SALES_MASTER_DISCOUNT" order="8"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_GRAND_TOTAL" oracleDatatype="number"
         columnOrder="20" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Sales Master Grand Total">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_GRAND_TOTAL"
           descriptiveExpression="SALES_MASTER_GRAND_TOTAL" order="9"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_MASTER_TOTAL_PRICE" oracleDatatype="number"
         columnOrder="18" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Sales Master Total Price">
          <dataDescriptor expression="SALES_MASTER.SALES_MASTER_TOTAL_PRICE"
           descriptiveExpression="SALES_MASTER_TOTAL_PRICE" order="7"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CUSTOMER_ADDRESS" datatype="vchar2" columnOrder="26"
         width="1000" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Customer Address">
          <dataDescriptor expression="CUSTOMER.CUSTOMER_ADDRESS"
           descriptiveExpression="CUSTOMER_ADDRESS" order="16" width="1000"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CUSTOMER_CELL_NUMBER1" datatype="vchar2"
         columnOrder="27" width="100" defaultWidth="100000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Customer Cell Number1">
          <dataDescriptor expression="CUSTOMER.CUSTOMER_CELL_NUMBER1"
           descriptiveExpression="CUSTOMER_CELL_NUMBER1" order="17"
           width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CUSTOMER_CELL_NUMBER2" datatype="vchar2"
         columnOrder="28" width="100" defaultWidth="100000"
         defaultHeight="10000" columnFlags="1"
         defaultLabel="Customer Cell Number2">
          <dataDescriptor expression="CUSTOMER.CUSTOMER_CELL_NUMBER2"
           descriptiveExpression="CUSTOMER_CELL_NUMBER2" order="21"
           width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
      <group name="G_ITEM_ID">
        <displayInfo x="0.79138" y="4.21924" width="2.41736" height="1.62695"
        />
        <dataItem name="item_unit_name" datatype="vchar2" columnOrder="33"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Item Unit Name">
          <dataDescriptor expression="item_unit_name"
           descriptiveExpression="ITEM_UNIT_NAME" order="23" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_QUANTITY" oracleDatatype="number"
         columnOrder="30" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Sales Quantity">
          <dataDescriptor expression="SALES_DETAILS.SALES_QUANTITY"
           descriptiveExpression="SALES_QUANTITY" order="18"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="UNIT_PRICE" oracleDatatype="number" columnOrder="31"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Unit Price" valueIfNull=".00">
          <dataDescriptor expression="SALES_DETAILS.UNIT_PRICE"
           descriptiveExpression="UNIT_PRICE" order="19"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ITTEM_TOTAL" oracleDatatype="number" columnOrder="32"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Ittem Total" valueIfNull=".00">
          <dataDescriptor
           expression="SALES_DETAILS.SALES_QUANTITY * SALES_DETAILS.UNIT_PRICE"
           descriptiveExpression="ITTEM_TOTAL" order="20"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ITEM_ID" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="20000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Item Id">
          <dataDescriptor expression="SALES_DETAILS.ITEM_ID"
           descriptiveExpression="ITEM_ID" order="4" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ITEM_UNIT_ID" oracleDatatype="number" columnOrder="23"
         width="22" defaultWidth="20000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Item Unit Id">
          <dataDescriptor expression="SALES_DETAILS.ITEM_UNIT_ID"
           descriptiveExpression="ITEM_UNIT_ID" order="12"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ITEM_NAME" datatype="vchar2" columnOrder="25"
         width="101" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Item Name">
          <dataDescriptor expression="&apos; &apos; || ITEM.ITEM_NAME"
           descriptiveExpression="ITEM_NAME" order="14" width="101"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="SALES_DETAILS_ID" oracleDatatype="number"
         columnOrder="14" width="22" defaultWidth="20000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Sales Details Id">
          <dataDescriptor expression="SALES_DETAILS.SALES_DETAILS_ID"
           descriptiveExpression="SALES_DETAILS_ID" order="3"
           oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ITEM_ID1" oracleDatatype="number" columnOrder="24"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Item Id1">
          <dataDescriptor expression="ITEM.ITEM_ID"
           descriptiveExpression="ITEM_ID" order="13" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="CUSTOMER_CODE" datatype="vchar2" columnOrder="29"
         width="100" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Customer Code">
          <dataDescriptor expression="CUSTOMER.CUSTOMER_CODE"
           descriptiveExpression="CUSTOMER_CODE" order="22" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="CS_5" source="SALES_MASTER_DUE" function="sum" width="20"
     precision="10" reset="report" compute="report" defaultWidth="0"
     defaultHeight="0" columnFlags="8" defaultLabel="Cs 5">
      <displayInfo x="4.72913" y="4.37500" width="1.00000" height="0.22913"/>
    </summary>
    <summary name="CS_2" source="SALES_MASTER_DISCOUNT" function="sum"
     width="20" precision="10" reset="report" compute="report"
     defaultWidth="0" defaultHeight="0" columnFlags="8" defaultLabel="Cs 2">
      <displayInfo x="4.73950" y="3.57300" width="0.90637" height="0.21863"/>
    </summary>
    <summary name="CS_3" source="SALES_MASTER_GRAND_TOTAL" function="sum"
     width="20" precision="10" reset="report" compute="report"
     defaultWidth="0" defaultHeight="0" columnFlags="8" defaultLabel="Cs 3">
      <displayInfo x="4.73962" y="3.85413" width="0.96875" height="0.19995"/>
    </summary>
    <summary name="CS_4" source="SALES_MASTER_PAY" function="sum" width="20"
     precision="10" reset="report" compute="report" defaultWidth="0"
     defaultHeight="0" columnFlags="8" defaultLabel="Cs 4">
      <displayInfo x="4.76038" y="4.13538" width="0.94800" height="0.20837"/>
    </summary>
    <summary name="CS_1" source="SALES_MASTER_TOTAL_PRICE" function="sum"
     width="20" precision="10" reset="report" compute="report"
     defaultWidth="0" defaultHeight="0" columnFlags="8" defaultLabel="Cs 1">
      <displayInfo x="4.80212" y="3.29163" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body width="8.12500" height="10.56250">
      <location x="0.18750" y="0.43750"/>
      <frame name="M_G_CUSTOMER_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.12500" width="8.06250" height="7.62500"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings linePattern="solid"/>
        <repeatingFrame name="R_G_CUSTOMER_ID" source="G_CUSTOMER_ID"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.12500" width="8.06250"
           height="7.62500"/>
          <generalLayout verticalElasticity="variable"/>
          <visualSettings linePattern="solid"/>
          <text name="B_CUSTOMER_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="0.37500" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Cusotomer ID             :]]>
              </string>
            </textSegment>
          </text>
          <field name="F_SALES_INVOICE" source="SALES_INVOICE"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="Arial" size="11" bold="yes"/>
            <geometryInfo x="1.50000" y="0.18750" width="0.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_CUSTOMER_ID" source="CUSTOMER_ID" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="Arial" size="11" bold="yes"/>
            <geometryInfo x="1.50000" y="0.37500" width="0.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_CUSTOMER_NAME" source="Customer_Name"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Arial" size="11" bold="yes" italic="yes"/>
            <geometryInfo x="1.50000" y="0.56250" width="3.31250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_CUSTOMER_ADDRESS" source="CUSTOMER_ADDRESS"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Arial" size="11"/>
            <geometryInfo x="1.50000" y="0.75000" width="3.31250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_CUSTOMER_CELL_NUMBER1" source="CUSTOMER_CELL_NUMBER1"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Arial" size="11"/>
            <geometryInfo x="1.50000" y="0.93750" width="3.31250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_CUSTOMER_CELL_NUMBER2" source="CUSTOMER_CELL_NUMBER2"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Arial" size="11"/>
            <geometryInfo x="1.50000" y="1.12500" width="3.31250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <line name="B_3" arrow="none">
            <geometryInfo x="0.00000" y="1.93750" width="8.06250"
             height="0.00000"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <points>
              <point x="0.00000" y="1.93750"/>
              <point x="8.06250" y="1.93750"/>
            </points>
          </line>
          <rectangle name="B_18">
            <geometryInfo x="0.00000" y="1.93750" width="8.06250"
             height="5.81250"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="0.00000" y="1.93750"/>
              <point x="8.06250" y="5.81250"/>
            </points>
          </rectangle>
          <frame name="M_G_ITEM_ID_HDR">
            <geometryInfo x="0.00000" y="1.93750" width="8.06250"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray36" linePattern="solid"
             lineForegroundColor="r50g0b0"/>
            <text name="B_ITEM_ID" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="0.00000" y="1.93750" width="0.62500"
               height="0.18750"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="gray36" linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[SKU ID]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_UNIT_ID" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="0.62500" y="1.93750" width="0.81250"
               height="0.18750"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="gray36" linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[Item Unit Id]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_NAME" minWidowLines="1">
              <textSettings justify="end" spacing="0"/>
              <geometryInfo x="6.93750" y="1.93750" width="1.12500"
               height="0.18750"/>
              <visualSettings linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[Item Total ]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_NAME1" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="1.43750" y="1.93750" width="3.31250"
               height="0.18750"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="gray36" linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes"/>
                <string>
                <![CDATA[Item Name]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_NAME2" minWidowLines="1">
              <textSettings justify="end" spacing="0"/>
              <geometryInfo x="4.75000" y="1.93750" width="0.87500"
               height="0.18750"/>
              <visualSettings linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[Sales Qty.]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_NAME4" minWidowLines="1">
              <textSettings justify="end" spacing="0"/>
              <geometryInfo x="6.12500" y="1.93750" width="0.81250"
               height="0.18750"/>
              <visualSettings linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[Rate]]>
                </string>
              </textSegment>
            </text>
            <text name="B_ITEM_NAME3" minWidowLines="1">
              <textSettings justify="center" spacing="0"/>
              <geometryInfo x="5.62500" y="1.93750" width="0.50000"
               height="0.18750"/>
              <visualSettings linePattern="solid"
               lineForegroundColor="r50g0b0"/>
              <textSegment>
                <font face="helvetica" size="8" bold="yes" textColor="r50g0b0"
                />
                <string>
                <![CDATA[Unit]]>
                </string>
              </textSegment>
            </text>
            <line name="B_13" arrow="none">
              <geometryInfo x="0.56250" y="2.06250" width="0.00000"
               height="0.00122"/>
              <advancedLayout printObjectOnPage="allPage"
               basePrintingOn="anchoringObject"/>
              <visualSettings fillPattern="transparent" linePattern="solid"/>
              <points>
                <point x="0.56250" y="2.06250"/>
                <point x="0.56250" y="2.06372"/>
              </points>
            </line>
          </frame>
          <repeatingFrame name="R_G_ITEM_ID" source="G_ITEM_ID"
           printDirection="down" minWidowRecords="1" columnMode="no">
            <geometryInfo x="0.00000" y="2.12500" width="8.06250"
             height="0.37500"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings fillPattern="transparent" linePattern="solid"/>
            <field name="F_ITEM_ID" source="ITEM_ID" minWidowLines="1"
             spacing="0" alignment="center">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="0.00000" y="2.18750" width="0.62500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings fillPattern="transparent"/>
            </field>
            <field name="F_ITEM_UNIT_ID" source="SALES_DETAILS_ID"
             minWidowLines="1" spacing="0" alignment="center">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="0.62500" y="2.18750" width="0.62500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings fillPattern="transparent"/>
            </field>
            <field name="F_ITEM_NAME" source="ITTEM_TOTAL" minWidowLines="1"
             formatMask="99,99,999.99" spacing="0" alignment="end">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="7.06250" y="2.18750" width="1.00000"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
            </field>
            <field name="F_ITEM_NAME1" source="ITEM_NAME" minWidowLines="1"
             spacing="0" alignment="start">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="1.37500" y="2.18750" width="2.43750"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings fillPattern="transparent"/>
            </field>
            <field name="F_ITEM_NAME2" source="SALES_QUANTITY"
             minWidowLines="1" formatMask="NNNNNNNNNNN0D00" spacing="0"
             alignment="end">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="4.75000" y="2.18750" width="0.87500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
            </field>
            <field name="F_ITEM_NAME4" source="UNIT_PRICE" minWidowLines="1"
             formatMask="99,99,999.99" spacing="0" alignment="end">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="6.12500" y="2.18750" width="0.87500"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
            </field>
            <field name="F_ITEM_NAME3" source="item_unit_name"
             minWidowLines="1" formatMask="NNNNNNNNNNN0D00" spacing="0"
             alignment="center">
              <font face="Arial" size="12" bold="yes"/>
              <geometryInfo x="5.62500" y="2.18750" width="0.50000"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
            </field>
            <line name="B_4" arrow="none" stretchWithFrame="R_G_ITEM_ID">
              <geometryInfo x="3.81250" y="1.93750" width="0.00000"
               height="0.56250"/>
              <visualSettings linePattern="solid"/>
              <points>
                <point x="3.81250" y="1.93750"/>
                <point x="3.81250" y="2.50000"/>
              </points>
            </line>
          </repeatingFrame>
          <frame name="M_G_ITEM_ID_GRPFR">
            <geometryInfo x="0.00000" y="2.50000" width="8.06250"
             height="5.25000"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings linePattern="solid"/>
          </frame>
          <text name="B_SALES_INVOICE4" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.75000" y="0.87500" width="1.50000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Transport Name & No   :       :]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CUSTOMER_CELL_NUMBER1" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="0.75000" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Location]]>
              </string>
            </textSegment>
          </text>
          <text name="B_SALES_INVOICE" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="0.18750" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Invoice No                  :]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CUSTOMER_ADDRESS" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="0.56250" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Customer Name         :]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CUSTOMER_CELL_NUMBER2" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="1.12500" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Contract-2]]>
              </string>
            </textSegment>
          </text>
          <text name="B_CUSTOMER_ADDRESS1" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="0.93750" width="1.25000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Contract-1]]>
              </string>
            </textSegment>
          </text>
          <line name="B_2" arrow="none">
            <geometryInfo x="1.43750" y="0.12500" width="0.00000"
             height="1.81250"/>
            <visualSettings lineWidth="1" fillPattern="transparent"
             linePattern="solid"/>
            <points>
              <point x="1.43750" y="0.12500"/>
              <point x="1.43750" y="1.93750"/>
            </points>
          </line>
          <field name="F_SALES_INVOICE1" source="action_date"
           minWidowLines="1" formatMask="DD/MM/RRrr HH:mi:Ss" spacing="0"
           alignment="center">
            <font face="Arial" size="11" bold="yes"/>
            <geometryInfo x="6.37500" y="0.18750" width="1.56250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <field name="F_SALES_INVOICE2" source="action_user"
           minWidowLines="1" formatMask="DD/MM/RRrr HH:mi:Ss" spacing="0"
           alignment="start">
            <font face="Arial" size="11" bold="yes" italic="yes"
             underline="yes"/>
            <geometryInfo x="6.37500" y="0.37500" width="1.56250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
          </field>
          <text name="B_SALES_INVOICE1" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.75000" y="0.18750" width="1.50000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Sales Date & Time   ]]>
              </string>
            </textSegment>
          </text>
          <line name="B_14" arrow="none">
            <geometryInfo x="6.31250" y="0.12500" width="0.00000"
             height="1.81250"/>
            <visualSettings lineWidth="1" fillPattern="transparent"
             linePattern="solid"/>
            <points>
              <point x="6.31250" y="0.12500"/>
              <point x="6.31250" y="1.93750"/>
            </points>
          </line>
          <text name="B_SALES_INVOICE2" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.75000" y="0.37500" width="1.50000"
             height="0.25000"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Prepared by               ]]>
              </string>
            </textSegment>
          </text>
          <text name="B_SALES_INVOICE3" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="4.75000" y="0.62500" width="1.50000"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"/>
            <textSegment>
              <font face="Arial" size="11" italic="yes"/>
              <string>
              <![CDATA[Delivary Date            ]]>
              </string>
            </textSegment>
          </text>
        </repeatingFrame>
      </frame>
      <field name="F_3" source="CS_1" minWidowLines="1"
       formatMask="99,99,999.99" spacing="0" alignment="end">
        <font face="Courier New" size="12" bold="yes"/>
        <geometryInfo x="6.43750" y="7.75000" width="1.62500" height="0.31250"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
      </field>
      <field name="F_4" source="CS_2" minWidowLines="1"
       formatMask="99,99,999.99" spacing="0" alignment="end">
        <font face="Courier New" size="12" bold="yes"/>
        <geometryInfo x="6.43750" y="8.06250" width="1.62500" height="0.25000"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
      </field>
      <field name="F_7" source="CS_3" minWidowLines="1"
       formatMask="99,99,999.99" spacing="0" alignment="end">
        <font face="Courier New" size="12" bold="yes"/>
        <geometryInfo x="6.43750" y="8.31250" width="1.62500" height="0.25000"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
      </field>
      <field name="F_5" source="CS_4" minWidowLines="1"
       formatMask="99,99,999.99" spacing="0" alignment="end">
        <font face="Courier New" size="12" bold="yes"/>
        <geometryInfo x="6.43750" y="8.56250" width="1.62500" height="0.25000"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
      </field>
      <field name="F_9" source="CS_5" minWidowLines="1"
       formatMask="99,99,999.99" spacing="0" alignment="end">
        <font face="Courier New" size="12" bold="yes"/>
        <geometryInfo x="6.43750" y="8.81250" width="1.62500" height="0.25000"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent" linePattern="solid"/>
      </field>
      <line name="B_17" arrow="none">
        <geometryInfo x="6.50000" y="9.81250" width="1.43750" height="0.00000"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="6.50000" y="9.81250"/>
          <point x="7.93750" y="9.81250"/>
        </points>
      </line>
      <text name="B_6" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="6.60413" y="9.83337" width="1.45837" height="0.16785"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <textSegment>
          <font face="Tahoma" size="10"/>
          <string>
          <![CDATA[Authorised Signature]]>
          </string>
        </textSegment>
      </text>
      <text name="B_5" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="1.37500" y="10.22913" width="5.37500"
         height="0.16785"/>
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <textSegment>
          <font face="Arial" size="10" italic="yes" underline="yes"
           textColor="r0g0b100"/>
          <string>
          <![CDATA[Developed by : bdtrustsoft.com, Thakurgaon-5100, Bangladesh, +88 01719 44 1000]]>
          </string>
        </textSegment>
      </text>
      <rectangle name="B_19">
        <geometryInfo x="0.00000" y="7.75000" width="8.06250" height="0.31250"
        />
        <visualSettings linePattern="solid"/>
        <points>
          <point x="0.00000" y="7.75000"/>
          <point x="8.06250" y="0.31250"/>
        </points>
      </rectangle>
      <text name="B_7" minWidowLines="1">
        <textSettings justify="end" spacing="single"/>
        <geometryInfo x="5.25000" y="8.06250" width="1.18750" height="0.25000"
        />
        <visualSettings linePattern="solid"/>
        <textSegment>
          <font face="Times New Roman" size="11" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Discount (Amt.) ]]>
          </string>
        </textSegment>
      </text>
      <text name="B_8" minWidowLines="1">
        <textSettings justify="end" spacing="single"/>
        <geometryInfo x="5.25000" y="8.31250" width="1.18750" height="0.25000"
        />
        <visualSettings linePattern="solid"/>
        <textSegment>
          <font face="Times New Roman" size="11" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Grand Total ]]>
          </string>
        </textSegment>
      </text>
      <text name="B_9" minWidowLines="1">
        <textSettings justify="end" spacing="single"/>
        <geometryInfo x="5.25000" y="8.56250" width="1.18750" height="0.25000"
        />
        <visualSettings linePattern="solid"/>
        <textSegment>
          <font face="Times New Roman" size="11" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Pay ]]>
          </string>
        </textSegment>
      </text>
      <text name="B_10" minWidowLines="1">
        <textSettings justify="end" spacing="single"/>
        <geometryInfo x="5.25000" y="8.81250" width="1.18750" height="0.25000"
        />
        <visualSettings linePattern="solid"/>
        <textSegment>
          <font face="Times New Roman" size="11" bold="yes" italic="yes"/>
          <string>
          <![CDATA[Due ]]>
          </string>
        </textSegment>
      </text>
      <line name="B_16" arrow="none">
        <geometryInfo x="3.37500" y="9.81250" width="1.93750" height="0.00000"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="3.37500" y="9.81250"/>
          <point x="5.31250" y="9.81250"/>
        </points>
      </line>
      <text name="B_12" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="3.43750" y="9.85413" width="1.66785" height="0.16785"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings lineBackgroundColor="black"/>
        <textSegment>
          <font face="Tahoma" size="10"/>
          <string>
          <![CDATA[Godown Incharge Signature]]>
          </string>
        </textSegment>
      </text>
      <line name="B_15" arrow="none">
        <geometryInfo x="0.12500" y="9.87500" width="1.37500" height="0.00000"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="0.12500" y="9.87500"/>
          <point x="1.50000" y="9.87500"/>
        </points>
      </line>
      <text name="B_11" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.19788" y="9.91663" width="1.19910" height="0.16785"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings lineBackgroundColor="black"/>
        <textSegment>
          <font face="Tahoma" size="10"/>
          <string>
          <![CDATA[Customer Signature]]>
          </string>
        </textSegment>
      </text>
      <text name="B_20" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.00000" y="7.81250" width="1.12500" height="0.16663"
        />
        <textSegment>
          <font face="Courier New" size="12" bold="yes" italic="yes"
           underline="yes"/>
          <string>
          <![CDATA[Sub Total:]]>
          </string>
        </textSegment>
      </text>
    </body>
    <margin>
      <text name="B_1" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.18750" y="0.12500" width="8.06250" height="0.31250"
        />
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="TextColor" lineForegroundColor="r100g0b0"/>
        <textSegment>
          <font face="Tahoma" size="14" bold="yes" textColor="white"/>
          <string>
          <![CDATA[M/S SM MEDECINE                                                                          INVOICE/BILL]]>
          </string>
        </textSegment>
      </text>
    </margin>
  </section>
  </layout>
  <colorPalette>
    <color index="190" displayName="TextColor" value="#336699"/>
    <color index="191" displayName="TableHeading" value="#cccc99"/>
    <color index="192" displayName="TableCell" value="#f7f7e7"/>
    <color index="193" displayName="Totals" value="#ffffcc"/>
  </colorPalette>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName="rwbeige"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

<HEAD>
  <TITLE> Your Title </TITLE>
  <rw:style id="rwbeige218">
<link rel="StyleSheet" type="text/css" href="css/rwbeige.css">
</rw:style>

  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ffffff" rowSpan=2 vAlign=middle width=188><IMG alt="" src="images/rwbeige_logo.gif" width="135" height="36"></TD>
    <TD bgColor="#ffffff" height=40 vAlign=top><IMG alt="" height=1 src="images/stretch.gif" width=5></TD>
    <TD align=right bgColor="#ffffff" vAlign=bottom>&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE bgColor="#ff0000" border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" class="OraColumnHeader">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" vAlign=top class="OraColumnHeader"><IMG alt="" border=0 height=17 src="images/topcurl.gif" width=30></TD>
    <TD vAlign=top width="100%">
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY>
        <TR>
          <TD bgColor="#000000" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#9a9c9a" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#b3b4b3" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="29%" valign="top">
      <TABLE width="77%" border="0" cellspacing="0" cellpadding="0">
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_d_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation goes here </TD>
        </TR>
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_r_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation Item</TD>
        </TR>
      </TABLE>
    </TD>
    <TD width="71%">
      <DIV align="center">
      <!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGCUSTOMERIDGRPFR175">
<rw:foreach id="RGCUSTOMERID1751" src="G_CUSTOMER_ID">
<!-- Start GetGroupHeader/n --> <table class="OraTable">
 <caption class="OraHeader">  <br>Customer Id <rw:field id="F_CUSTOMER_ID" src="CUSTOMER_ID" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_CUSTOMER_ID </rw:field><br>
Sales Master Id <rw:field id="F_SALES_MASTER_ID" src="SALES_MASTER_ID" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_SALES_MASTER_ID </rw:field><br>
Sales Invoice <rw:field id="F_SALES_INVOICE" src="SALES_INVOICE" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_SALES_INVOICE </rw:field><br>
Customer Name <rw:field id="F_CUSTOMER_NAME" src="CUSTOMER_NAME" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_CUSTOMER_NAME </rw:field><br>
Customer
Address <rw:field id="F_CUSTOMER_ADDRESS" src="CUSTOMER_ADDRESS" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_CUSTOMER_ADDRESS </rw:field><br>
Customer
Cell Number1 <rw:field id="F_CUSTOMER_CELL_NUMBER1" src="CUSTOMER_CELL_NUMBER1" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_CUSTOMER_CELL_NUMBER1 </rw:field><br>
Customer
Cell Number2 <rw:field id="F_CUSTOMER_CELL_NUMBER2" src="CUSTOMER_CELL_NUMBER2" breakLevel="RGCUSTOMERID1751" breakValue="&nbsp;"> F_CUSTOMER_CELL_NUMBER2 </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <table class="OraTable" summary="">
     <!-- Header -->
     <thead>
      <tr>
       <th <rw:id id="HBITEMID175" asArray="no"/> class="OraColumnHeader"> Item Id </th>
       <th <rw:id id="HBITEMUNITID175" asArray="no"/> class="OraColumnHeader"> Item Unit Id </th>
       <th <rw:id id="HBITEMNAME175" asArray="no"/> class="OraColumnHeader"> Item Name </th>
      </tr>
     </thead>
     <!-- Body -->
     <tbody>
      <rw:foreach id="RGITEMID1751" src="G_ITEM_ID">
       <tr>
        <td <rw:headers id="HFITEMID175" src="HBITEMID175"/> class="OraCellNumber"><rw:field id="FITEMID175" src="ITEM_ID" nullValue="&nbsp;"> F_ITEM_ID </rw:field></td>
        <td <rw:headers id="HFITEMUNITID175" src="HBITEMUNITID175"/> class="OraCellNumber"><rw:field id="FITEMUNITID175" src="ITEM_UNIT_ID" nullValue="&nbsp;"> F_ITEM_UNIT_ID </rw:field></td>
        <td <rw:headers id="HFITEMNAME175" src="HBITEMNAME175"/> class="OraCellText"><rw:field id="FITEMNAME175" src="ITEM_NAME" nullValue="&nbsp;"> F_ITEM_NAME </rw:field></td>
       </tr>
      </rw:foreach>
     </tbody>
     <tr>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table class="OraTable" summary="">
</table>
</rw:dataArea> <!-- id="MGCUSTOMERIDGRPFR175" -->
<!-- End of Data Area Generated by Reports Developer -->

      </DIV>
    </TD>
  </TR>
</TABLE>

<P>
  <BR>
</P>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ff0000" colSpan=2 class="OraColumnHeader"><IMG alt="" border=0 height=4 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ffffff">&nbsp;</TD>
    <TD align=right bgColor="#ffffff">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>

</HTML>

<!--
</rw:report>
-->
