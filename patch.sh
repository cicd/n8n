#!/bin/bash

# Remove .ee. references from tsconfig
sed -i '' '/\.ee\./d' tsconfig.build.json

# Patch license key check
sed -i '' 's/if (licenseKey)/if (true)/g' packages/cli/src/Server.ts

# Patch license validation to always be true
sed -i '' 's/licenseIsValid = .*$/licenseIsValid = true;/g' packages/core/src/Services/FeatureFlagsService.ts

# Patch enterprise feature check to always return true
sed -i '' "s/export function isEnterpriseFeatureEnabled(feature: string): boolean {/export function isEnterpriseFeatureEnabled(feature: string): boolean { return true; }/" packages/editor-ui/src/utils/featureFlags.ts
