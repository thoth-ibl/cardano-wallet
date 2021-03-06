module Golden.APIV1Types
   ( tests
   ) where

import           Universum

import           Hedgehog (Property)
import qualified Hedgehog as H

import           Cardano.Wallet.API.V1.Types (AddressOwnership (..),
                     WalAddress (..), WalletInputSelectionPolicy (..),
                     WalletPassPhrase (..), WalletTimestamp (..))
import           Pos.Client.Txp.Util (InputSelectionPolicy (..))
import           Pos.Core (Address, Timestamp, decodeTextAddress,
                     parseTimestamp)

import           Pos.Crypto (PassPhrase (..))

import           Test.Pos.Util.Golden (discoverGolden, goldenTestJSON)

-----------------------------------------------------------------------
-- Main test export
-----------------------------------------------------------------------

tests :: IO Bool
tests =
    H.checkSequential $$discoverGolden

-------------------------------------------------------------------------------
-- API V1 ToJSON/FromJSON
-------------------------------------------------------------------------------

golden_WalletPassPhrase :: Property
golden_WalletPassPhrase =
    goldenTestJSON
        (WalletPassPhrase examplePassPhrase)
        "test/unit/Golden/golden/apiV1Types/json/PassPhrase"

golden_WalletTimestamp :: Property
golden_WalletTimestamp =
    goldenTestJSON
        (WalletTimestamp exampleTimestamp)
        "test/unit/Golden/golden/apiV1Types/json/Timestamp"

golden_WalletInputSelectionPolicy1 :: Property
golden_WalletInputSelectionPolicy1 =
    goldenTestJSON
        (WalletInputSelectionPolicy OptimizeForSecurity)
        "test/unit/Golden/golden/apiV1Types/json/InputSelectionPolicy1"

golden_WalletInputSelectionPolicy2 :: Property
golden_WalletInputSelectionPolicy2 =
    goldenTestJSON
        (WalletInputSelectionPolicy OptimizeForHighThroughput)
        "test/unit/Golden/golden/apiV1Types/json/InputSelectionPolicy2"

golden_WalletAddress1 :: Property
golden_WalletAddress1 =
    goldenTestJSON
        (WalAddress exampleAddress1)
        "test/unit/Golden/golden/apiV1Types/json/Address1"

golden_WalletAddress2 :: Property
golden_WalletAddress2 =
    goldenTestJSON
        (WalAddress exampleAddress2)
        "test/unit/Golden/golden/apiV1Types/json/Address2"

golden_AddressOwnership1 :: Property
golden_AddressOwnership1 =
    goldenTestJSON
        AddressIsOurs
        "test/unit/Golden/golden/apiV1Types/json/AddressOwnership1"

golden_AddressOwnership2 :: Property
golden_AddressOwnership2 =
    goldenTestJSON
        AddressAmbiguousOwnership
        "test/unit/Golden/golden/apiV1Types/json/AddressOwnership2"

-------------------------------------------------------------------------------
-- Examples
-------------------------------------------------------------------------------

-- | Currently PassPhrase should be 32 bytes long.
examplePassPhrase :: PassPhrase
examplePassPhrase = PassPhrase "hello_new_awesome_cardano_wallet"

exampleTimestamp :: Timestamp
exampleTimestamp = timestamp
  where
    Just timestamp = parseTimestamp "2018-12-11T08:09:10"

exampleAddress1 :: Address
exampleAddress1 = address
  where
    Right address = decodeTextAddress "Ae2tdPwUPEZD3PkAcijLa9MP5Juyq6if6k2Xo1dqyvGm4cs6PkZiKrTrSZE"

exampleAddress2 :: Address
exampleAddress2 = address
  where
    Right address = decodeTextAddress "DdzFFzCqrhshvqztiAaVUuKkZWMepHt2oG1YoTxTt2cgyfaTFSnniFe55u5enazUEf77WDA5EC1gNErvtH7egHL8YZFqj2y4x3dm4hFa"
