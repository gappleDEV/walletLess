import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
 
import { User } from '../_models/user';
 
@Injectable()
export class UserService {
    constructor(private http: HttpClient) { }
 
    getAll() {
        return this.http.get<User[]>('/api/UserAccount/GetUserAccounts');
    }
 
    getById(id: number) {
        return this.http.get('/api/UserAccount/GetUser/'+ id);
    }
 
    create(user: User) {
        return this.http.post('/api/UserAccount/CreateUser', user);
    }
 
    update(user: User) {
        return this.http.put('/api/UserAccount/UpdateUser/' + user.id, user);
    }
 
    delete(id: number) {
        return this.http.delete('/api/UserAccount/DeleteUser/' + id);
    }
}