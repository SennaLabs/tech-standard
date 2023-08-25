import { Test, TestingModule } from '@nestjs/testing';
import { Address } from '../../../entities/address.entity';
import { Repository } from 'typeorm';
import { AddressesService } from './addresses.service';
import { AddressesResolver } from './addresses.resolver';
import { User } from 'src/entities/user.entity';

export type MockType<T> = {
  [P in keyof T]?: jest.Mock<unknown>;
};

describe('AddressesService', () => {
  let resolver: AddressesResolver;
  let service: AddressesService;
  let addressRepositoryMock: MockType<Repository<Address>>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AddressesService],
    }).compile();

    service = module.get<AddressesService>(AddressesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should find an address', async () => {
    const address = { id: 1, address: 'Bangkok' };
    addressRepositoryMock.findOne.mockReturnValue(address);
    expect(await service.findOne(1)).toEqual(address);
  });

  it('should create an Address', async () => {
    const address = {
      fullName: 'John Doe',
      address: 'Bangkok',
      postcode: '10400',
      province: 'Bangkok',
      district: 'Bangkok Yai',
      subDistrict: 'Bangkok Noi',
      phoneNumber: '0912345678',
      email: 'test@mail.com',
      isDefault: true,
    };
    const user = new User();
    user.id = 1;
    user.firstName = 'John';
    user.lastName = 'Doe';

    expect(await service.create(user, address)).toEqual(address);
  });

  it('should update an Address', async () => {
    const address = {
      id: 1,
      address: 'Bangkok',
      postcode: '10400',
      province: 'Bangkok',
      district: 'Bangkok Yai',
      subDistrict: 'Bangkok Noi',
      phoneNumber: '0912345678',
      email: 'test@mail.com',
      isDefault: true,
    };
    const user = new User();
    user.id = 1;
    user.firstName = 'John';
    user.lastName = 'Doe';

    jest.spyOn(addressRepositoryMock, 'preload').mockReturnValue(address);
    expect(await service.update(user, address.id, address)).toEqual(address);
  });

  it('should update an Address', async () => {
    const address = {
      id: 1,
      address: 'Bangkok',
      postcode: '10400',
      province: 'Bangkok',
      district: 'Bangkok Yai',
      subDistrict: 'Bangkok Noi',
      phoneNumber: '0912345678',
      email: 'test@mail.com',
      isDefault: true,
    };
    const user = new User();
    user.id = 1;
    user.firstName = 'John';
    user.lastName = 'Doe';

    jest.spyOn(addressRepositoryMock, 'preload').mockReturnValue(address);
    expect(await service.update(user, address.id, address)).toEqual(address);
  });

  it('should remove an Address', async () => {
    const address = {
      id: 1,
      address: 'Bangkok',
      postcode: '10400',
      province: 'Bangkok',
      district: 'Bangkok Yai',
      subDistrict: 'Bangkok Noi',
      phoneNumber: '0912345678',
      email: 'test@mail.com',
      isDefault: true,
    };
    const user = new User();
    user.id = 1;
    user.firstName = 'John';
    user.lastName = 'Doe';

    jest.spyOn(addressRepositoryMock, 'find').mockReturnValue(address);
    expect(await service.remove(address.id, user)).toEqual(address);
  });
});
