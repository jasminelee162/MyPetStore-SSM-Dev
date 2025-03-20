package org.csu.petstore.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileStorageService {
    String updateImage(MultipartFile file, String id) throws IOException;
    void deleteImage(String id) throws IOException;
    String saveFile(MultipartFile file,String id) throws IOException;
}
