import { Args, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { User } from '../../../entities/user.entity';
import { Address } from '../../../entities/address.entity';
import { AddressesService } from './addresses.service';
import { CreateAddressInput } from './dto/create-address.input';
import { UpdateAddressInput } from './dto/update-address.input';

@Resolver(() => Address)
export class AddressesResolver {
  constructor(private readonly addressService: AddressesService) {}

  @Mutation(() => Address, { name: 'createAddress' })
  async createAddress(
    @Args('user') user: User,
    @Args('createAddressInput') createAddressInput: CreateAddressInput,
  ) {
    return this.addressService.create(user, createAddressInput);
  }

  @Query(() => [Address], { name: 'addresses' })
  findAll() {
    return this.addressService.findAll();
  }

  @Query(() => Address, { name: 'address' })
  findOne(@Args('id', { type: () => Int }) id: number) {
    return this.addressService.findOne(id);
  }

  @Mutation(() => Address, { name: 'updateAddress' })
  updateAddress(
    @Args('user') user: User,
    @Args('updateAddressInput') updateAddressInput: UpdateAddressInput,
  ) {
    return this.addressService.update(
      user,
      updateAddressInput.id,
      updateAddressInput,
    );
  }

  @Mutation(() => [Address])
  async removeAddress(
    @Args('user') user: User,
    @Args('id', { type: () => Int }) id: number,
  ) {
    return this.addressService.remove(id, user);
  }
}
