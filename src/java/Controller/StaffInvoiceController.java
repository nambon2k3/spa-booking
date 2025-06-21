/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.InvoiceDAO;
import Model.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name = "StaffInvoiceController", urlPatterns = {"/staff/invoices"})
public class StaffInvoiceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InvoiceDAO invoiceDAO = new InvoiceDAO();

        // Lấy paymentMethod từ query parameter
        String paymentMethod = request.getParameter("paymentMethod"); // "vnpay", "direct", hoặc null

        // Phân trang
        int page = 1;
        int pageSize = 10;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        int offset = (page - 1) * pageSize;

        // Lấy danh sách hóa đơn
        List<Invoice> invoices = invoiceDAO.getInvoices(paymentMethod, offset, pageSize);

        // Lấy tổng số bản ghi để tính số trang
        int totalRecords = invoiceDAO.countInvoices(paymentMethod);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        // Gửi về JSP
        request.setAttribute("invoices", invoices);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("paymentMethod", paymentMethod);

        request.getRequestDispatcher("../staff-invoice-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
