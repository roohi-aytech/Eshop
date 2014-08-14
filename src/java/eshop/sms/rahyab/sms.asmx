<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://srv-pardis.sms1000.ir/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://srv-pardis.sms1000.ir/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://srv-pardis.sms1000.ir/">
      <s:element name="HelloWorld">
        <s:complexType />
      </s:element>
      <s:element name="HelloWorldResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="HelloWorldResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doGetInfo">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doGetInfoResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doGetInfoResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doSendSMS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uNumber" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uCellphones" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uMessage" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="uFarsi" type="s:boolean" />
            <s:element minOccurs="1" maxOccurs="1" name="uTopic" type="s:boolean" />
            <s:element minOccurs="1" maxOccurs="1" name="uFlash" type="s:boolean" />
            <s:element minOccurs="0" maxOccurs="1" name="uUDH" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doSendSMSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doSendSMSResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doSendArraySMS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uNumber" type="tns:ArrayOfString" />
            <s:element minOccurs="0" maxOccurs="1" name="uCellphone" type="tns:ArrayOfString" />
            <s:element minOccurs="0" maxOccurs="1" name="uMessage" type="tns:ArrayOfString" />
            <s:element minOccurs="0" maxOccurs="1" name="uFarsi" type="tns:ArrayOfBoolean" />
            <s:element minOccurs="0" maxOccurs="1" name="uTopic" type="tns:ArrayOfBoolean" />
            <s:element minOccurs="0" maxOccurs="1" name="uFlash" type="tns:ArrayOfBoolean" />
            <s:element minOccurs="0" maxOccurs="1" name="uUDH" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfString">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="string" nillable="true" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfBoolean">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="boolean" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:element name="doSendArraySMSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doSendArraySMSResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doGetDelivery">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uReturnIDs" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doGetDeliveryResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doGetDeliveryResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="uLastRowID" type="s:long" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doReceiveSMSResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSArray">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="uLastRowID" type="s:long" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSArrayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doReceiveSMSArrayResult" type="tns:ArrayOfMessageReceive" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfMessageReceive">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="MessageReceive" type="tns:MessageReceive" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="MessageReceive">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="RowID" type="s:long" />
          <s:element minOccurs="0" maxOccurs="1" name="DateTime" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Sender" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Receiver" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Message" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="getInfoXML">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getInfoXMLResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getInfoXMLResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="HelloWorldSoapIn">
    <wsdl:part name="parameters" element="tns:HelloWorld" />
  </wsdl:message>
  <wsdl:message name="HelloWorldSoapOut">
    <wsdl:part name="parameters" element="tns:HelloWorldResponse" />
  </wsdl:message>
  <wsdl:message name="doGetInfoSoapIn">
    <wsdl:part name="parameters" element="tns:doGetInfo" />
  </wsdl:message>
  <wsdl:message name="doGetInfoSoapOut">
    <wsdl:part name="parameters" element="tns:doGetInfoResponse" />
  </wsdl:message>
  <wsdl:message name="doSendSMSSoapIn">
    <wsdl:part name="parameters" element="tns:doSendSMS" />
  </wsdl:message>
  <wsdl:message name="doSendSMSSoapOut">
    <wsdl:part name="parameters" element="tns:doSendSMSResponse" />
  </wsdl:message>
  <wsdl:message name="doSendArraySMSSoapIn">
    <wsdl:part name="parameters" element="tns:doSendArraySMS" />
  </wsdl:message>
  <wsdl:message name="doSendArraySMSSoapOut">
    <wsdl:part name="parameters" element="tns:doSendArraySMSResponse" />
  </wsdl:message>
  <wsdl:message name="doGetDeliverySoapIn">
    <wsdl:part name="parameters" element="tns:doGetDelivery" />
  </wsdl:message>
  <wsdl:message name="doGetDeliverySoapOut">
    <wsdl:part name="parameters" element="tns:doGetDeliveryResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSSoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMS" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSSoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSArraySoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMSArray" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSArraySoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSArrayResponse" />
  </wsdl:message>
  <wsdl:message name="getInfoXMLSoapIn">
    <wsdl:part name="parameters" element="tns:getInfoXML" />
  </wsdl:message>
  <wsdl:message name="getInfoXMLSoapOut">
    <wsdl:part name="parameters" element="tns:getInfoXMLResponse" />
  </wsdl:message>
  <wsdl:portType name="smsSoap">
    <wsdl:operation name="HelloWorld">
      <wsdl:input message="tns:HelloWorldSoapIn" />
      <wsdl:output message="tns:HelloWorldSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doGetInfo">
      <wsdl:input message="tns:doGetInfoSoapIn" />
      <wsdl:output message="tns:doGetInfoSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <wsdl:input message="tns:doSendSMSSoapIn" />
      <wsdl:output message="tns:doSendSMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <wsdl:input message="tns:doSendArraySMSSoapIn" />
      <wsdl:output message="tns:doSendArraySMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doGetDelivery">
      <wsdl:input message="tns:doGetDeliverySoapIn" />
      <wsdl:output message="tns:doGetDeliverySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <wsdl:input message="tns:doReceiveSMSSoapIn" />
      <wsdl:output message="tns:doReceiveSMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSArray">
      <wsdl:input message="tns:doReceiveSMSArraySoapIn" />
      <wsdl:output message="tns:doReceiveSMSArraySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getInfoXML">
      <wsdl:input message="tns:getInfoXMLSoapIn" />
      <wsdl:output message="tns:getInfoXMLSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="smsSoap" type="tns:smsSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="HelloWorld">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/HelloWorld" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doGetInfo">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doGetInfo" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doSendSMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doSendArraySMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doGetDelivery">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doGetDelivery" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doReceiveSMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSArray">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/doReceiveSMSArray" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getInfoXML">
      <soap:operation soapAction="http://srv-pardis.sms1000.ir/getInfoXML" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="smsSoap12" type="tns:smsSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="HelloWorld">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/HelloWorld" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doGetInfo">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doGetInfo" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doSendSMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doSendArraySMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doGetDelivery">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doGetDelivery" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doReceiveSMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSArray">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/doReceiveSMSArray" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getInfoXML">
      <soap12:operation soapAction="http://srv-pardis.sms1000.ir/getInfoXML" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="sms">
    <wsdl:port name="smsSoap" binding="tns:smsSoap">
      <soap:address location="http://rahyabbulk.ir:8020/webservice/sms.asmx" />
    </wsdl:port>
    <wsdl:port name="smsSoap12" binding="tns:smsSoap12">
      <soap12:address location="http://rahyabbulk.ir:8020/webservice/sms.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>