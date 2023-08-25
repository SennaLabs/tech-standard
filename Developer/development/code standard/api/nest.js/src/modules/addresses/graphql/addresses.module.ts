import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from '../../../entities/address.entity';
import { AddressesResolver } from './addresses.resolver';
import { AddressesService } from './addresses.service';

@Module({
  imports: [TypeOrmModule.forFeature([Address])],
  providers: [AddressesResolver, AddressesService],
})
export class AddressesModule {}
