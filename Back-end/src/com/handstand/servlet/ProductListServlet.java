package com.handstand.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.handstand.entity.Category;
import com.handstand.entity.Product;
import com.handstand.service.impl.ProductServiceImpl;

/**
 * 
 * @author MEHMET PEKDEMİR
 *
 */
@WebServlet(urlPatterns = { "/listProduct" })
public class ProductListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String CATEGORIES = "categories";

	//Ürünleri listeliyor.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		List<Product> products = null;
		Category category = new Category();
		try {
			ProductServiceImpl productService = new ProductServiceImpl();
			products = productService.listProduct();
			category.setProducts(products);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		
		request.setAttribute(CATEGORIES, category);

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/productListView.jsp");
		dispatcher.forward(request, response);

	}

	//doGet e yönleniyoruz
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
}
