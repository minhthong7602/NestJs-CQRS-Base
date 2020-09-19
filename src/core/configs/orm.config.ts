import { TypeOrmModuleOptions } from '@nestjs/typeorm';
export const ormConfig: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'localhost',
  username: 'root',
  password: 'xxxxxxxxxx',
  port: 3306,
  database: 'bruceleeblog',
  entities: ["dist/**/*.entity{.ts,.js}"],
  synchronize: false
}