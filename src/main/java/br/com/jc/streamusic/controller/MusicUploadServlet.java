package br.com.jc.streamusic.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
* Servlet implementation class MusicUploadServlet
*/
@WebServlet("/musicupload")
@MultipartConfig
public class MusicUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MusicUploadServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/error.jsp";

        if(request.getSession().getAttribute("User") != null) {
            try {
                String title = request.getParameter("musicTitle");
                String artist = request.getParameter("musicArtist");
                String album = request.getParameter("musicAlbum");
                int style = Integer.parseInt(request.getParameter("musicStyle"));
                
                Part filePart = request.getPart("musicFile");
                
                String contentDisp = filePart.getHeader("content-disposition");
                String[] items = contentDisp.split(";");
                String fileName = "";
                
                for (String item : items) {
                    if (item.trim().startsWith("filename")) {
                        fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                        fileName = fileName.substring(fileName.lastIndexOf('/') + 1)
                                           .substring(fileName.lastIndexOf('\\') + 1);
                        break;
                    }
                }
                
                if (fileName.isEmpty()) {
                    fileName = "arquivo_" + System.currentTimeMillis() + ".mp3";
                }
                
                String musicDirPath = getServletContext().getRealPath("/") + "musics";
                java.io.File musicDir = new java.io.File(musicDirPath);
                if (!musicDir.exists()) {
                    musicDir.mkdir();
                }
                
                String filePath = musicDirPath + java.io.File.separator + fileName;
                
                System.out.println("File name: " + filePath);
                
                InputStream fileContent = filePart.getInputStream();
                FileOutputStream fileMP3 = new FileOutputStream(filePath);
                
                byte[] buffer = new byte[1024];
                int bytesRead;
                
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    fileMP3.write(buffer, 0, bytesRead);
                }
                
                fileContent.close();
                fileMP3.close();
                
                System.out.println("Musica salva com sucesso!");
                
            } catch(Exception e) {
                request.setAttribute("errorSTR", "Erro: Upload falhou! " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            request.setAttribute("errorSTR", "Erro: Usuário não conectado");
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}