package com.api.automation.postrequest.fileupload;

import com.intuit.karate.junit5.Karate;

class TestFileUploadRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("fileUpload").relativeTo(getClass());
    }
}
