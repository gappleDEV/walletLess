package com.walletless.api.services;

import com.walletless.api.dao.PureformImageFileRepository;
import com.walletless.api.dao.RequestRepository;
import com.walletless.api.models.PureformImageFile;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Service
public class PureformImageFileService {

    @Autowired
    private PureformImageFileRepository pureformImageFileRepository;
    @Autowired
    private RequestRepository requestRepository;

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

    public PureformImageFile getFile(String fileId, Integer requestId) throws Exception {
        Optional<Request> requestOptional = requestRepository.findById(requestId);

        if(requestOptional.isPresent()) {
            Request request = requestOptional.get();
            if(request.isApproved() && !request.isExpired()){
                return pureformImageFileRepository.findById(fileId).orElseThrow(() -> new Exception("File not found with id " + fileId));
            }
        }
        return null;
    }
}
