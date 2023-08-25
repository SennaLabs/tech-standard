import configuration from './configuration';
import { SnakeNamingStrategy } from 'typeorm-naming-strategies';
import { ConnectionOptions } from 'typeorm';
const config = configuration();
const connectionOptions: ConnectionOptions = {
  type: 'postgres',
  host: config.database.host,
  port: config.database.port,
  username: config.database.username,
  password: config.database.password,
  database: config.database.name,
  synchronize: false,
  namingStrategy: new SnakeNamingStrategy(),
  entities: [__dirname + '/../entities/*.entity{.ts,.js}'],
  migrations: [__dirname + '/../migration/*{.ts,.js}'],
  ssl: process.env.MODE === 'production',
};

export default connectionOptions;
