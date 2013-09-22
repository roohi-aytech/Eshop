/**
 * FilterBean.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public class FilterBean  implements java.io.Serializable {
    private short docState;

    private short docType;

    private double maxAmount;

    private String maxTransDate;

    private double minAmount;

    private String minTransDate;

    private String refNum;

    private String resNum;

    public FilterBean() {
    }

    public FilterBean(
           short docState,
           short docType,
           double maxAmount,
           String maxTransDate,
           double minAmount,
           String minTransDate,
           String refNum,
           String resNum) {
           this.docState = docState;
           this.docType = docType;
           this.maxAmount = maxAmount;
           this.maxTransDate = maxTransDate;
           this.minAmount = minAmount;
           this.minTransDate = minTransDate;
           this.refNum = refNum;
           this.resNum = resNum;
    }


    /**
     * Gets the docState value for this FilterBean.
     * 
     * @return docState
     */
    public short getDocState() {
        return docState;
    }


    /**
     * Sets the docState value for this FilterBean.
     * 
     * @param docState
     */
    public void setDocState(short docState) {
        this.docState = docState;
    }


    /**
     * Gets the docType value for this FilterBean.
     * 
     * @return docType
     */
    public short getDocType() {
        return docType;
    }


    /**
     * Sets the docType value for this FilterBean.
     * 
     * @param docType
     */
    public void setDocType(short docType) {
        this.docType = docType;
    }


    /**
     * Gets the maxAmount value for this FilterBean.
     * 
     * @return maxAmount
     */
    public double getMaxAmount() {
        return maxAmount;
    }


    /**
     * Sets the maxAmount value for this FilterBean.
     * 
     * @param maxAmount
     */
    public void setMaxAmount(double maxAmount) {
        this.maxAmount = maxAmount;
    }


    /**
     * Gets the maxTransDate value for this FilterBean.
     * 
     * @return maxTransDate
     */
    public String getMaxTransDate() {
        return maxTransDate;
    }


    /**
     * Sets the maxTransDate value for this FilterBean.
     * 
     * @param maxTransDate
     */
    public void setMaxTransDate(String maxTransDate) {
        this.maxTransDate = maxTransDate;
    }


    /**
     * Gets the minAmount value for this FilterBean.
     * 
     * @return minAmount
     */
    public double getMinAmount() {
        return minAmount;
    }


    /**
     * Sets the minAmount value for this FilterBean.
     * 
     * @param minAmount
     */
    public void setMinAmount(double minAmount) {
        this.minAmount = minAmount;
    }


    /**
     * Gets the minTransDate value for this FilterBean.
     * 
     * @return minTransDate
     */
    public String getMinTransDate() {
        return minTransDate;
    }


    /**
     * Sets the minTransDate value for this FilterBean.
     * 
     * @param minTransDate
     */
    public void setMinTransDate(String minTransDate) {
        this.minTransDate = minTransDate;
    }


    /**
     * Gets the refNum value for this FilterBean.
     * 
     * @return refNum
     */
    public String getRefNum() {
        return refNum;
    }


    /**
     * Sets the refNum value for this FilterBean.
     * 
     * @param refNum
     */
    public void setRefNum(String refNum) {
        this.refNum = refNum;
    }


    /**
     * Gets the resNum value for this FilterBean.
     * 
     * @return resNum
     */
    public String getResNum() {
        return resNum;
    }


    /**
     * Sets the resNum value for this FilterBean.
     * 
     * @param resNum
     */
    public void setResNum(String resNum) {
        this.resNum = resNum;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
    	if (obj == null) return false;
        if (!(obj instanceof FilterBean)) return false;
        FilterBean other = (FilterBean) obj;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.docState == other.getDocState() &&
            this.docType == other.getDocType() &&
            this.maxAmount == other.getMaxAmount() &&
            ((this.maxTransDate==null && other.getMaxTransDate()==null) || 
             (this.maxTransDate!=null &&
              this.maxTransDate.equals(other.getMaxTransDate()))) &&
            this.minAmount == other.getMinAmount() &&
            ((this.minTransDate==null && other.getMinTransDate()==null) || 
             (this.minTransDate!=null &&
              this.minTransDate.equals(other.getMinTransDate()))) &&
            ((this.refNum==null && other.getRefNum()==null) || 
             (this.refNum!=null &&
              this.refNum.equals(other.getRefNum()))) &&
            ((this.resNum==null && other.getResNum()==null) || 
             (this.resNum!=null &&
              this.resNum.equals(other.getResNum())));
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
        _hashCode += getDocState();
        _hashCode += getDocType();
        _hashCode += new Double(getMaxAmount()).hashCode();
        if (getMaxTransDate() != null) {
            _hashCode += getMaxTransDate().hashCode();
        }
        _hashCode += new Double(getMinAmount()).hashCode();
        if (getMinTransDate() != null) {
            _hashCode += getMinTransDate().hashCode();
        }
        if (getRefNum() != null) {
            _hashCode += getRefNum().hashCode();
        }
        if (getResNum() != null) {
            _hashCode += getResNum().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(FilterBean.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:Foo", "FilterBean"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docState");
        elemField.setXmlName(new javax.xml.namespace.QName("", "docState"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "short"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docType");
        elemField.setXmlName(new javax.xml.namespace.QName("", "docType"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "short"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("maxAmount");
        elemField.setXmlName(new javax.xml.namespace.QName("", "maxAmount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("maxTransDate");
        elemField.setXmlName(new javax.xml.namespace.QName("", "maxTransDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("minAmount");
        elemField.setXmlName(new javax.xml.namespace.QName("", "minAmount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("minTransDate");
        elemField.setXmlName(new javax.xml.namespace.QName("", "minTransDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("refNum");
        elemField.setXmlName(new javax.xml.namespace.QName("", "refNum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("resNum");
        elemField.setXmlName(new javax.xml.namespace.QName("", "resNum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
