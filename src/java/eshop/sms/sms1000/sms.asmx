<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://tempuri.org/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
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
      <s:element name="doSendArraySMS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uNumber" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uCellphone" type="tns:ArrayOfString" />
            <s:element minOccurs="0" maxOccurs="1" name="uMessage" type="tns:ArrayOfString" />
            <s:element minOccurs="0" maxOccurs="1" name="uFarsi" type="tns:ArrayOfBoolean" />
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
            <s:element minOccurs="0" maxOccurs="1" name="doSendArraySMSResult" type="tns:ArrayOfString" />
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
      <s:element name="doReceiveSMSDS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="uLastRowID" type="s:long" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSDSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doReceiveSMSDSResult">
              <s:complexType>
                <s:sequence>
                  <s:element ref="s:schema" />
                  <s:any />
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSAll">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSAllResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doReceiveSMSAllResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSAllDS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="doReceiveSMSAllDSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="doReceiveSMSAllDSResult">
              <s:complexType>
                <s:sequence>
                  <s:element ref="s:schema" />
                  <s:any />
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDelivery">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uReturnIDs" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getDeliveryResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getDeliveryResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getInfo">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="uUsername" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="uPassword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getInfoResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getInfoResult" type="s:string" />
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
  <wsdl:message name="doSendArraySMSSoapIn">
    <wsdl:part name="parameters" element="tns:doSendArraySMS" />
  </wsdl:message>
  <wsdl:message name="doSendArraySMSSoapOut">
    <wsdl:part name="parameters" element="tns:doSendArraySMSResponse" />
  </wsdl:message>
  <wsdl:message name="doSendSMSSoapIn">
    <wsdl:part name="parameters" element="tns:doSendSMS" />
  </wsdl:message>
  <wsdl:message name="doSendSMSSoapOut">
    <wsdl:part name="parameters" element="tns:doSendSMSResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSSoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMS" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSSoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSDSSoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMSDS" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSDSSoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSDSResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSAllSoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMSAll" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSAllSoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSAllResponse" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSAllDSSoapIn">
    <wsdl:part name="parameters" element="tns:doReceiveSMSAllDS" />
  </wsdl:message>
  <wsdl:message name="doReceiveSMSAllDSSoapOut">
    <wsdl:part name="parameters" element="tns:doReceiveSMSAllDSResponse" />
  </wsdl:message>
  <wsdl:message name="getDeliverySoapIn">
    <wsdl:part name="parameters" element="tns:getDelivery" />
  </wsdl:message>
  <wsdl:message name="getDeliverySoapOut">
    <wsdl:part name="parameters" element="tns:getDeliveryResponse" />
  </wsdl:message>
  <wsdl:message name="getInfoSoapIn">
    <wsdl:part name="parameters" element="tns:getInfo" />
  </wsdl:message>
  <wsdl:message name="getInfoSoapOut">
    <wsdl:part name="parameters" element="tns:getInfoResponse" />
  </wsdl:message>
  <wsdl:portType name="smsSoap">
    <wsdl:operation name="HelloWorld">
      <wsdl:input message="tns:HelloWorldSoapIn" />
      <wsdl:output message="tns:HelloWorldSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <wsdl:input message="tns:doSendArraySMSSoapIn" />
      <wsdl:output message="tns:doSendArraySMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <wsdl:input message="tns:doSendSMSSoapIn" />
      <wsdl:output message="tns:doSendSMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <wsdl:input message="tns:doReceiveSMSSoapIn" />
      <wsdl:output message="tns:doReceiveSMSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSDS">
      <wsdl:input message="tns:doReceiveSMSDSSoapIn" />
      <wsdl:output message="tns:doReceiveSMSDSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAll">
      <wsdl:input message="tns:doReceiveSMSAllSoapIn" />
      <wsdl:output message="tns:doReceiveSMSAllSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAllDS">
      <wsdl:input message="tns:doReceiveSMSAllDSSoapIn" />
      <wsdl:output message="tns:doReceiveSMSAllDSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getDelivery">
      <wsdl:input message="tns:getDeliverySoapIn" />
      <wsdl:output message="tns:getDeliverySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getInfo">
      <wsdl:input message="tns:getInfoSoapIn" />
      <wsdl:output message="tns:getInfoSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="smsSoap" type="tns:smsSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="HelloWorld">
      <soap:operation soapAction="http://tempuri.org/HelloWorld" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <soap:operation soapAction="http://tempuri.org/doSendArraySMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <soap:operation soapAction="http://tempuri.org/doSendSMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <soap:operation soapAction="http://tempuri.org/doReceiveSMS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSDS">
      <soap:operation soapAction="http://tempuri.org/doReceiveSMSDS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAll">
      <soap:operation soapAction="http://tempuri.org/doReceiveSMSAll" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAllDS">
      <soap:operation soapAction="http://tempuri.org/doReceiveSMSAllDS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDelivery">
      <soap:operation soapAction="http://tempuri.org/getDelivery" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getInfo">
      <soap:operation soapAction="http://tempuri.org/getInfo" style="document" />
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
      <soap12:operation soapAction="http://tempuri.org/HelloWorld" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendArraySMS">
      <soap12:operation soapAction="http://tempuri.org/doSendArraySMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doSendSMS">
      <soap12:operation soapAction="http://tempuri.org/doSendSMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMS">
      <soap12:operation soapAction="http://tempuri.org/doReceiveSMS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSDS">
      <soap12:operation soapAction="http://tempuri.org/doReceiveSMSDS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAll">
      <soap12:operation soapAction="http://tempuri.org/doReceiveSMSAll" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="doReceiveSMSAllDS">
      <soap12:operation soapAction="http://tempuri.org/doReceiveSMSAllDS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getDelivery">
      <soap12:operation soapAction="http://tempuri.org/getDelivery" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getInfo">
      <soap12:operation soapAction="http://tempuri.org/getInfo" style="document" />
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
      <soap:address location="http://sms1000.ir/webservice/sms.asmx" />
    </wsdl:port>
    <wsdl:port name="smsSoap12" binding="tns:smsSoap12">
      <soap12:address location="http://sms1000.ir/webservice/sms.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>