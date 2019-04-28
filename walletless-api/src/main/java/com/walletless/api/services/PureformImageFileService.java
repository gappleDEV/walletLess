package com.walletless.api.services;

import com.walletless.api.dao.PureformImageFileRepository;
import com.walletless.api.models.PureformImageFile;
import com.walletless.api.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PureformImageFileService {

    @Autowired
    private PureformImageFileRepository pureformImageFileRepository;

    public PureformImageFile storeFile(MultipartFile file, User user) throws Exception {
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            if(fileName.contains("..")){
                throw new Exception();
                //FileStorageException
            }

            PureformImageFile pfImageFile = new PureformImageFile(fileName, file.getContentType(), file.getBytes(), user);
            return pureformImageFileRepository.save(pfImageFile);
        } catch (Exception e) {
            throw new Exception();
            //FileStorageException
        }
    }

    public PureformImageFile getFile(String fileId, User user) throws Exception {
        return pureformImageFileRepository.findById(fileId)
                .orElseThrow(() -> new Exception("File not found with id " + fileId));
    }
}
