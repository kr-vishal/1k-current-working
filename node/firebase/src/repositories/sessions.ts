import { IBaseRepository } from "./base_repository";
import SessionModel from "../models/sessions";
import { QuerySnapshot } from "firebase/firestore/lite";

class SessionRepository implements IBaseRepository<SessionModel>{
    find(id: any): Promise<QuerySnapshot> {
        throw new Error("Method not implemented.");
    }
    insert(values: {}): Promise<QuerySnapshot> {
        throw new Error("Method not implemented.");
    }
    update(id: any, values: {}): Promise<QuerySnapshot> {
        throw new Error("Method not implemented.");
    }
    delete(id: string | number): Promise<QuerySnapshot> {
        throw new Error("Method not implemented.");
    }
    

}

export default SessionRepository;