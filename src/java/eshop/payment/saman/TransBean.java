/**
 * TransBean.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public class TransBean  implements java.io.Serializable {
    private double amount;

    private short docType;

    private short docstate;

    private String localTransDate;

    private String mtId;

    private String refNum;

    private String resNum;

    private String transDate;

    public TransBean() {
    }

    public TransBean(
           double amount,
           short docType,
           short docstate,
           String localTransDate,
           String mtId,
           String refNum,
           String resNum,
           String transDate) {
           this.amount = amount;
           this.docType = docType;
           this.docstate = docstate;
           this.localTransDate = localTransDate;
           this.mtId = mtId;
           this.refNum = refNum;
           this.resNum = resNum;
           this.transDate = transDate;
    }


    /**
     * Gets the amount value for this TransBean.
     * 
     * @return amount
     */
    public double getAmount() {
        return amount;
    }


    /**
     * Sets the amount value for this TransBean.
     * 
     * @param amount
     */
    public void setAmount(double amount) {
        this.amount = amount;
    }


    /**
     * Gets the docType value for this TransBean.
     * 
     * @return docType
     */
    public short getDocType() {
        return docType;
    }


    /**
     * Sets the docType value for this TransBean.
     * 
     * @param docType
     */
    public void setDocType(short docType) {
        this.docType = docType;
    }


    /**
     * Gets the docstate value for this TransBean.
     * 
     * @return docstate
     */
    public short getDocstate() {
        return docstate;
    }


    /**
     * Sets the docstate value for this TransBean.
     * 
     * @param docstate
     */
    public void setDocstate(short docstate) {
        this.docstate = docstate;
    }


    /**
     * Gets the localTransDate value for this TransBean.
     * 
     * @return localTransDate
     */
    public String getLocalTransDate() {
        return localTransDate;
    }


    /**
     * Sets the localTransDate value for this TransBean.
     * 
     * @param localTransDate
     */
    public void setLocalTransDate(String localTransDate) {
        this.localTransDate = localTransDate;
    }


    /**
     * Gets the mtId value for this TransBean.
     * 
     * @return mtId
     */
    public String getMtId() {
        return mtId;
    }


    /**
     * Sets the mtId value for this TransBean.
     * 
     * @param mtId
     */
    public void setMtId(String mtId) {
        this.mtId = mtId;
    }


    /**
     * Gets the refNum value for this TransBean.
     * 
     * @return refNum
     */
    public String getRefNum() {
        return refNum;
    }


    /**
     * Sets the refNum value for this TransBean.
     * 
     * @param refNum
     */
    public void setRefNum(String refNum) {
        this.refNum = refNum;
    }


    /**
     * Gets the resNum value for this TransBean.
     * 
     * @return resNum
     */
    public String getResNum() {
        return resNum;
    }


    /**
     * Sets the resNum value for this TransBean.
     * 
     * @param resNum
     */
    public void setResNum(String resNum) {
        this.resNum = resNum;
    }


    /**
     * Gets the transDate value for this TransBean.
     * 
     * @return transDate
     */
    public String getTransDate() {
        return transDate;
    }


    /**
     * Sets the transDate value for this TransBean.
     * 
     * @param transDate
     */
    public void setTransDate(String transDate) {
        this.transDate = transDate;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
    	if (obj == null) return false;
        if (!(obj instanceof TransBean)) return false;
        TransBean other = (TransBean) obj;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.amount == other.getAmount() &&
            this.docType == other.getDocType() &&
            this.docstate == other.getDocstate() &&
            ((this.localTransDate==null && other.getLocalTransDate()==null) || 
             (this.localTransDate!=null &&
              this.localTransDate.equals(other.getLocalTransDate()))) &&
            ((this.mtId==null && other.getMtId()==null) || 
             (this.mtId!=null &&
              this.mtId.equals(other.getMtId()))) &&
            ((this.refNum==null && other.getRefNum()==null) || 
             (this.refNum!=null &&
              this.refNum.equals(other.getRefNum()))) &&
            ((this.resNum==null && other.getResNum()==null) || 
             (this.resNum!=null &&
              this.resNum.equals(other.getResNum()))) &&
            ((this.transDate==null && other.getTransDate()==null) || 
             (this.transDate!=null &&
              this.transDate.equals(other.getTransDate())));
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
        _hashCode += new Double(getAmount()).hashCode();
        _hashCode += getDocType();
        _hashCode += getDocstate();
        if (getLocalTransDate() != null) {
            _hashCode += getLocalTransDate().hashCode();
        }
        if (getMtId() != null) {
            _hashCode += getMtId().hashCode();
        }
        if (getRefNum() != null) {
            _hashCode += getRefNum().hashCode();
        }
        if (getResNum() != null) {
            _hashCode += getResNum().hashCode();
        }
        if (getTransDate() != null) {
            _hashCode += getTransDate().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(TransBean.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:Foo", "TransBean"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("amount");
        elemField.setXmlName(new javax.xml.namespace.QName("", "amount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docType");
        elemField.setXmlName(new javax.xml.namespace.QName("", "docType"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "short"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docstate");
        elemField.setXmlName(new javax.xml.namespace.QName("", "docstate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "short"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("localTransDate");
        elemField.setXmlName(new javax.xml.namespace.QName("", "localTransDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("mtId");
        elemField.setXmlName(new javax.xml.namespace.QName("", "mtId"));
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
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("transDate");
        elemField.setXmlName(new javax.xml.namespace.QName("", "transDate"));
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
