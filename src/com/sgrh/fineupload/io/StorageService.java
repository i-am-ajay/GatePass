package com.sgrh.fineupload.io;

import javax.servlet.http.HttpServletRequest;

import com.sgrh.fineupload.model.UploadRequest;

/**
 * Created by ovaldez on 11/13/16.
 */
public interface StorageService {

    void save(UploadRequest uploadRequest);

    void delete(String uuid);

    void mergeChunks(String uuid, String fileName, int totalParts, long totalFileSize);

	void save(UploadRequest ur, HttpServletRequest req);

}