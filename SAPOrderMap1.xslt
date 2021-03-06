<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	xmlns="https://github.com/jimlane/schemas"
	xmlns:xsl="http://www.w3.org/2001/XMLSchema-instance"
	xsl:schemaLocation="http://github.com/jimlane/schemas https://raw.githubusercontent.com/jimlane/schemas/master/OrderFile1.xsd"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<msxsl:script implements-prefix="user" language="C#">
        <![CDATA[
          public string FormatCurrency(string amount)
          {
            return decimal.Parse(amount).ToString("C0");
          }

          public string FormatDate(string dateValue)
          {
            return DateTime.Parse(dateValue).ToString("MM/dd/yyyy");
          }
          ]]>
    </msxsl:script>
	<xsl:output method="xml" version="1.0" />
	<xsl:template match="/">
		<OrderHeader>
			<OrderDate>
				<xsl:value-of select="user:FormatDate(/OrderHeader/OrderDate/text())" />
			</OrderDate>
			<EstimatedDeliveryDate>
				<xsl:value-of select="user:FormatDate(/OrderHeader/EstimatedDeliveryDate/text())" />
			</EstimatedDeliveryDate>
			<OrderNumber>
				<xsl:value-of select="OrderHeader/OrderNumber/text()" />
			</OrderNumber>
		</OrderHeader>
		<CustomerDetails>
			<Name>
				<xsl:value-of select="CustomerDetails/Name/text()" />
			</Name>
			<Address>
				<xsl:value-of select="CustomerDetails/Address/text()" />
			</Address>
		</CustomerDetails>
		<OrderDetails>
			<ItemDescription>
				<xsl:value-of select="OrderDetails/ItemDescription/text()" />
			</ItemDescription>
			<ItemCustomerCode>
				<xsl:value-of select="OrderDetails/ItemCustomerCode/text()" />
			</ItemCustomerCode>
		</OrderDetails>
	</xsl:template>
</xsl:stylesheet>