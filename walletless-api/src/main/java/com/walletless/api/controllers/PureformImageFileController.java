package com.walletless.api.controllers;

import com.walletless.api.models.PureformImageFile;
import com.walletless.api.models.User;
import com.walletless.api.services.PureformImageFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class PureformImageFileController {

    @Autowired
    private PureformImageFileService pureformImageFileService;

    @PostMapping("/uploadFile")
    @ResponseBody
    public PureformImageFile uploadFile(@RequestParam MultipartFile file, @RequestBody User user) throws Exception{
        return pureformImageFileService.storeFile(file, user);
    }

    @PostMapping("/uploadMultipleFiles")
    public List<PureformImageFile> uploadMultipleFiles(@RequestParam MultipartFile[] files, User user) throws Exception{
//        return Arrays.asList(files).stream().map(file -> uploadFile(file, user)).collect(Collectors.toList());
        List<PureformImageFile> resultList = new ArrayList<>();

        for (MultipartFile file : files) {
            PureformImageFile responseFile = uploadFile(file, user);
            resultList.add(responseFile);
        }

        return resultList;
    }

    @PostMapping("/downloadFile/{fileId}/{requestId}")
    @ResponseBody
    public PureformImageFile downloadFile(@PathVariable String fileId, @PathVariable Integer requestId) throws Exception{
        return pureformImageFileService.getFile(fileId, requestId);

        //ResponseEntity<Reource>
//        return ResponseEntity.ok().contentType(MediaType.parseMediaType(pfImageFile.getFileType()))
//                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + pfImageFile.getFileName() + "\"")
//                .body(new ByteArrayResource(pfImageFile.getData()));
    }
}
