import { Component, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
    selector: 'app-view-users',
    templateUrl: './users.component.html',
})
export class UsersComponent {
    public users: WalletLessUser[];

    constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
        http.get<WalletLessUser[]>(baseUrl + 'api/UserAccount/GetUserAccounts').subscribe(result => {
            this.users = result;
        }, error => console.error(error));
    }
}

interface WalletLessUser {
    id: string;
    username: string;
    password: string;
    acctType: number;
    createDate: string;
    isActive: number;
}