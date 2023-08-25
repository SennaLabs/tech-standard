import { Field, InputType, Int, PartialType } from '@nestjs/graphql'
import { CreateAddressInput } from './create-address.input'

@InputType()
export class UpdateAddressInput extends PartialType(CreateAddressInput) {
  @Field(() => Int)
  id: number

  @Field(() => Boolean)
  isDefault: boolean
}
