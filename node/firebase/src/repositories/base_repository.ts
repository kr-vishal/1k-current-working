export interface IBaseRepository<T>{
    find(id : any) : Promise<T>;
    insert(values : {}) : Promise<T>;
    update(id : any, values:{}) : Promise<T>;
    delete(id : string|number) : Promise<T>;
}