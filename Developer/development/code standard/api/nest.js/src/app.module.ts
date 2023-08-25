import { Module } from '@nestjs/common';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import connectionOptions from './config/typeorm';
import { LoggingInterceptor } from './interceptors/logging.interceptors';
import { UsersModule } from './modules/users/rest/users.module';
import { BullModule } from '@nestjs/bull';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';

@Module({
  imports: [
    UsersModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      debug: false,
      playground: false,
    }),
    TypeOrmModule.forRoot(connectionOptions),
    BullModule.forRoot({ redis: { host: 'localhost', port: 6379 } }),
  ],
  controllers: [AppController],
  providers: [
    AppService,
    { provide: APP_INTERCEPTOR, useClass: LoggingInterceptor },
  ],
})
export class AppModule {}
