package org.csu.petstore.service;

import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;

public interface OrderService {

    public ItemVO getItem(String Item);
    public OrderVO getProduct(String product);
    public SequenceVO getSequence(String sequence);
    public LineItemVO getLineItem(String lineItem);
}
