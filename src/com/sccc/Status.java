package com.sccc;

import java.util.ArrayList;
import java.util.HashMap;

public class Status {
 
	private ArrayList<String> zhuangTai;
    private HashMap<String,ArrayList<String>> tiMu;
	public Status() {		
		     zhuangTai=new ArrayList<String>();
		     tiMu= new HashMap<String, ArrayList<String>>();
		   
		     String qingKuang="û�н�Ů���ѵĵ绰";		    		     
		     zhuangTai.add(qingKuang);		   
		     	     
		     String xuanXiang1="���ֻ�û����";
		     String xuanXiang2="���ڴ���Ϸ";
		     String xuanXiang3="���ڸ�������";
		     String xuanXiang4="����Ŭ������";
		   
		     
		     ArrayList<String> temp = new ArrayList<String>();		   
		     temp.add(xuanXiang1);
		     temp.add(xuanXiang2);
		     temp.add(xuanXiang3);
		     temp.add(xuanXiang4);
		    
		     tiMu.put(qingKuang,temp);		     
		     
	}
	public  ArrayList<String> getZhuangTai(){
		return zhuangTai;
	}
	public void setZhuangTai(ArrayList<String> zhuangTai){
		this.zhuangTai = zhuangTai;
	}
	public HashMap<String,ArrayList<String>> getTiMu(){
		     return tiMu;
	}
		
}

