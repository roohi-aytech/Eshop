/**
 * DoReceiveSMSAll.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.sms.sms1000;

public class DoReceiveSMSAll  implements java.io.Serializable {
    private String uUsername;

    private String uPassword;

    public DoReceiveSMSAll() {
    }

    public DoReceiveSMSAll(
           String uUsername,
           String uPassword) {
           this.uUsername = uUsername;
           this.uPassword = uPassword;
    }


    /**
     * Gets the uUsername value for this DoReceiveSMSAll.
     *
     * @return uUsername
     */
    public String getUUsername() {
        return uUsername;
    }


    /**
     * Sets the uUsername value for this DoReceiveSMSAll.
     *
     * @param uUsername
     */
    public void setUUsername(String uUsername) {
        this.uUsername = uUsername;
    }


    /**
     * Gets the uPassword value for this DoReceiveSMSAll.
     *
     * @return uPassword
     */
    public String getUPassword() {
        return uPassword;
    }


    /**
     * Sets the uPassword value for this DoReceiveSMSAll.
     *
     * @param uPassword
     */
    public void setUPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
        if (!(obj instanceof DoReceiveSMSAll)) return false;
        DoReceiveSMSAll other = (DoReceiveSMSAll) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true &&
            ((this.uUsername==null && other.getUUsername()==null) ||
             (this.uUsername!=null &&
              this.uUsername.equals(other.getUUsername()))) &&
            ((this.uPassword==null && other.getUPassword()==null) ||
             (this.uPassword!=null &&
              this.uPassword.equals(other.getUPassword())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getUUsername() != null) {
            _hashCode += getUUsername().hashCode();
        }
        if (getUPassword() != null) {
            _hashCode += getUPassword().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DoReceiveSMSAll.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://tempuri.org/", ">doReceiveSMSAll"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("UUsername");
        elemField.setXmlName(new javax.xml.namespace.QName("http://tempuri.org/", "uUsername"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("UPassword");
        elemField.setXmlName(new javax.xml.namespace.QName("http://tempuri.org/", "uPassword"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
