/**
 * TransResult.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public class TransResult  implements java.io.Serializable {
    private int resultCode;

    private String resultDesc;

    private eshop.payment.saman.TransBean[] transBean;

    public TransResult() {
    }

    public TransResult(
           int resultCode,
           String resultDesc,
           eshop.payment.saman.TransBean[] transBean) {
           this.resultCode = resultCode;
           this.resultDesc = resultDesc;
           this.transBean = transBean;
    }


    /**
     * Gets the resultCode value for this TransResult.
     * 
     * @return resultCode
     */
    public int getResultCode() {
        return resultCode;
    }


    /**
     * Sets the resultCode value for this TransResult.
     * 
     * @param resultCode
     */
    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }


    /**
     * Gets the resultDesc value for this TransResult.
     * 
     * @return resultDesc
     */
    public String getResultDesc() {
        return resultDesc;
    }


    /**
     * Sets the resultDesc value for this TransResult.
     * 
     * @param resultDesc
     */
    public void setResultDesc(String resultDesc) {
        this.resultDesc = resultDesc;
    }


    /**
     * Gets the transBean value for this TransResult.
     * 
     * @return transBean
     */
    public eshop.payment.saman.TransBean[] getTransBean() {
        return transBean;
    }


    /**
     * Sets the transBean value for this TransResult.
     * 
     * @param transBean
     */
    public void setTransBean(eshop.payment.saman.TransBean[] transBean) {
        this.transBean = transBean;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
    	if (obj == null) return false;
        if (!(obj instanceof TransResult)) return false;
        TransResult other = (TransResult) obj;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.resultCode == other.getResultCode() &&
            ((this.resultDesc==null && other.getResultDesc()==null) || 
             (this.resultDesc!=null &&
              this.resultDesc.equals(other.getResultDesc()))) &&
            ((this.transBean==null && other.getTransBean()==null) || 
             (this.transBean!=null &&
              java.util.Arrays.equals(this.transBean, other.getTransBean())));
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
        _hashCode += getResultCode();
        if (getResultDesc() != null) {
            _hashCode += getResultDesc().hashCode();
        }
        if (getTransBean() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getTransBean());
                 i++) {
                Object obj = java.lang.reflect.Array.get(getTransBean(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(TransResult.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:Foo", "TransResult"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("resultCode");
        elemField.setXmlName(new javax.xml.namespace.QName("", "resultCode"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("resultDesc");
        elemField.setXmlName(new javax.xml.namespace.QName("", "resultDesc"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("transBean");
        elemField.setXmlName(new javax.xml.namespace.QName("", "transBean"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:Foo", "TransBean"));
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
