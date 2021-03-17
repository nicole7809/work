package work.spring.model;

import java.util.List;

public interface MemberDBService {

	public void insertMember(MemberDataBean member) throws Exception;

	public int userCheck(MemberDataBean member) throws Exception;

	public int confirmId(MemberDataBean member) throws Exception;

	public MemberDataBean getMember(String id) throws Exception;



	
}
