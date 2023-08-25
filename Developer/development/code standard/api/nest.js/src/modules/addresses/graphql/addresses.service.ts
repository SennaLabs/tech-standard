import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Address } from '../../../entities/address.entity';
import { Repository } from 'typeorm';
import { CreateAddressInput } from './dto/create-address.input';
import { UpdateAddressInput } from './dto/update-address.input';
import { User } from 'src/entities/user.entity';

@Injectable()
export class AddressesService {
  constructor(
    @InjectRepository(Address)
    private readonly addressRepository: Repository<Address>,
  ) {}

  async create(user: User, createAddressInput: CreateAddressInput) {
    if (createAddressInput.isDefault) {
      await this.addressRepository.update({ user }, { isDefault: false });
    }
    const address = this.addressRepository.create(createAddressInput);
    address.user = user;
    return this.addressRepository.save(address);
  }

  findAll() {
    return this.addressRepository.find();
  }

  findOne(id: number) {
    return this.addressRepository.findOne({ where: { id: id } });
  }

  async update(user: User, id: number, updateAddressInput: UpdateAddressInput) {
    if (updateAddressInput.isDefault) {
      await this.addressRepository.update({ user }, { isDefault: false });
    }
    const address = await this.addressRepository.preload({
      id: id,
      ...updateAddressInput,
    });
    if (!address) {
      throw new NotFoundException(`Address #${id} not found`);
    }
    return this.addressRepository.save(address);
  }

  async remove(id: number, user: User) {
    const address = await this.addressRepository.findOne({ where: { id: id } });
    if (!address) {
      throw new NotFoundException(`Address #${id} not found`);
    }
    await this.addressRepository.remove(address);

    return await this.addressRepository.find({ where: { user: user } });
  }
}
