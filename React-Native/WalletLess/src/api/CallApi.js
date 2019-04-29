import {
    Alert
} from 'react-native';
import { copyBundledRealmFiles } from 'realm';

const type = {
    GET: "GET",
    POST: "POST",
    PUT: "PUT"
}

class CallApi {
    // Class for making API calls

    /**
     * 
     * @param {type} requestType 
     * @param {string} url 
     * @param {array or string} params - depending of the type of request, this will either be 
     *                                  an array for POST or string for GET
     */

    constructor(requestType, url, params) {
        this.requestType = requestType;
        this.url = url;
        this.params = params;
    }

    setUrl = (url) => {
        this.url = url;
    }

    request = async () => {
        const domain = 'http://12103740.ngrok.io'; //'http://192.168.1.152:8080';
        switch (this.requestType) {
            case type.GET:
                let getResponse = await fetch(domain + this.url + this.params).then((response) => {
                    return response.json();
                });
                return getResponse;
            case type.POST:
                let postResponse = 
                    await fetch(domain + this.url, {
                        method: type.POST,
                        headers: {
                            Accept: 'application/json',
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(this.params)
                    }).then((response) => {
                        return response.json()
                    });
                return postResponse;
            case type.PUT:
                break;
            default:
                break;
        }

    }

}

export {type, CallApi}