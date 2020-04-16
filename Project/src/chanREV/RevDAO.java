package chanREV;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import chanFAQ.FaqCommentDTO;
import chanFAQ.FaqDTO;
import sqlmap.MybatisManager;

public class RevDAO {

	public int count() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("chanrev.count_rev");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<RevDTO> list(int start, int end) {
		List<RevDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String, Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("listrev", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void insert(RevDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("chanrev.insert_rev", dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public List<RevDTO> searchList(String search_option, int start, int end) {
		List<RevDTO> list=null;
		try(SqlSession session=MybatisManager.getInstance().openSession()) {
			Map<String, Object> map=new HashMap<>();
			map.put("start",start);
			map.put("end",end);
			map.put("search_option","%"+search_option+"%");
			list=session.selectList("chanrev.searchList_rev", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000) {
				session.update("chanrev.plusReadCount_rev",num);
				session.commit();
				count_session.setAttribute("read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public RevDTO viewReplace(int num) {
		RevDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("chanrev.view_rev", num);
			//줄바꾸기
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public RevDTO view(int num) {
		RevDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("chanrev.view_rev", num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public String passwordCheck(int num, String password) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String, Object> map=new HashMap<>();
			map.put("num", num);
			map.put("password", password);
			result=session.selectOne("chanrev.pass_check_rev",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return result;
	}

	public void commentAdd(RevCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("chanrev.commentAdd_rev", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public List<RevCommentDTO> commentList(int num) {
		List<RevCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("chanrev.commentList_rev",num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			RevDTO dto=new RevDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("chanrev.updateStep_rev",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public void reply(RevDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("chanrev.reply_rev", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("chanrev.getFileName_rev", num);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void update(RevDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("chanrev.update_rev", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}

	}

	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("chanrev.delete_rev", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("chanrev.plusDown_rev", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public int searchCount(String search_option) {
		int count=0;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			count=session.selectOne("chanrev.searchCount", search_option);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return count;
	}

}
