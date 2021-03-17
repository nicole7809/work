package work.spring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberDAO")
public class MemberDBServiceMybatis implements MemberDBService {

	@Autowired
	SqlSessionTemplate dao = null;

	@Override
	public void insertMember(MemberDataBean member) throws Exception {
		dao.insert("member.insertMember", member);
	}

	@Override
	public int userCheck(MemberDataBean member) throws Exception {
		return dao.selectOne("member.userCheck", member);
	}

	@Override
	public int confirmId(MemberDataBean member) throws Exception {
		return dao.selectOne("member.userCheck", member);
	}

	@Override
	public MemberDataBean getMember(String id) throws Exception {
		return dao.selectOne("member.member", id);
	}


	
	
}