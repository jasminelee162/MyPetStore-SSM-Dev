package org.csu.petstore.service.impl;

import org.csu.petstore.service.FileStorageService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class FileStorageServiceImpl implements FileStorageService {
    // 使用 Paths.get() 以兼容不同系统
    private static final Path BASE_UPLOAD_DIR = Paths.get("src", "main", "resources", "static", "uploads");

    @Override
    public String updateImage(MultipartFile file, String id) throws IOException {
        // 先删除原有文件
        deleteImage(id);

        // 然后保存新的文件
        return saveFile(file,id);
    }


    // 删除图片方法
    @Override
    public void deleteImage(String id) throws IOException {
        Path uploadDir = BASE_UPLOAD_DIR; // 直接指向 uploads 目录

        // 遍历 uploads 目录，查找以 id 开头的文件（可能有不同扩展名）
        try {
            Files.list(uploadDir).forEach(file -> {
                if (file.getFileName().toString().startsWith(id)) {
                    try {
                        Files.delete(file);
                    } catch (IOException e) {
                        e.printStackTrace(); // 记录错误，但不中断流程
                    }
                }
            });
        } catch (IOException e) {
            throw new IOException("无法访问目录：" + uploadDir, e);
        }
    }



    @Override
    public String saveFile(MultipartFile file,String id) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("文件为空，无法保存");
        }

        // 目标目录：直接存放在 uploads 目录下
        Path uploadDir = BASE_UPLOAD_DIR;

        // 确保目录存在
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }

        // 获取文件扩展名
        String fileExtension = getFileExtension(file.getOriginalFilename());
        String fileName = id + fileExtension;  // 直接使用 id 作为文件名

        Path filePath = uploadDir.resolve(fileName);

        // 保存文件
        try {
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new IOException("文件保存失败：" + e.getMessage(), e);
        }

        // 返回前端可访问的 URL
        return "../uploads/" + fileName;
    }


    // 获取文件扩展名的方法
    private String getFileExtension(String filename) {
        int dotIndex = filename.lastIndexOf(".");
        return (dotIndex == -1) ? "" : filename.substring(dotIndex);
    }
}
