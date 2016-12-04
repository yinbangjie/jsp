package com.lol.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lol.model.Hero;
import com.lol.model.HeroManager;

public class HeroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;��

	public HeroServlet() {

		super();

	}

	/**
	 * 
	 * ��ʾĳһ��Ӣ�ۣ��鿴�ͱ༭ĳһ��Ӣ��ʱ�����õ����������
	 * 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HeroManager manager = new HeroManager();// ���ɹ������manager.

		int id = Integer.parseInt(request.getParameter("id"));// ��get��url���id,�Եõ�hero

		String isChange = request.getParameter("is_change");// ��get��url���is_change��ֵ,���ж���Ҫ�鿴���Ǳ༭һ��Ӣ�ۡ�

		String directPage = "";// ��Ҫת���ҳ�档

		Hero hero = manager.findOne(id);// ʹ��manager����͸ղŴ��ݹ�����id����ȡӢ��
										// request.setAttribute("hero",
										// hero);//����ȡ����Ӣ�۷ŵ�request����ȥ��

		// ���url��is_change����Ϊ�գ�˵������Ҫ��ת���༭ҳ��. //������Ӣ�۵���ʾҳ��.
		if (isChange != null) {

			directPage = "/lolView/update.jsp";

		} else {

			directPage = "/lolView/hero.jsp";

		}

		// ����hero��ֵת��

		RequestDispatcher dis = request.getRequestDispatcher(directPage);
		dis.forward(request, response);

	}

	/**
	 * 
	 * �޸ġ����ĳһ��Ӣ��
	 * 
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ת��

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String idStr = request.getParameter("id");// �ӱ����Ӣ��id

		HeroManager manager = new HeroManager();// ʹ��manager����͸ղŴ��ݹ�����id����ȡӢ��
												// Hero hero = new
												// Hero();//����һ���µ�Ӣ�۶���

		hero.setName(request.getParameter("name"));
		// ��ǰ̨���Ӣ��name������ֵ����ղ�������hero�����У��������ơ�

		hero.setNickName(request.getParameter("nickName"));
		hero.setAvatar(request.getParameter("avatar"));
		hero.setImage(request.getParameter("image"));
		hero.setDesc(request.getParameter("desc"));

		String info;

		if (idStr == null) {// ���ҳ�洫�ݹ���û��id���������Ӣ��

			manager.add(hero);
			info = "Ӣ���ѳɹ���ӣ�";

		} else {// ���ҳ�洫�ݹ�����id��˵�����޸�Ӣ��

			int id = Integer.parseInt(idStr);
			hero.setId(id);
			manager.modify(hero);
			info = "Ӣ���ѳɹ��޸ģ�";
		}

		request.setAttribute("info", info);
		request.setAttribute("hero", hero);

		RequestDispatcher dis = request.getRequestDispatcher("/lolView/hero.jsp");
		dis.forward(request, response);
	}

}
