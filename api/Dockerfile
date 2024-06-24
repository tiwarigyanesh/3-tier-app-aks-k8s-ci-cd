FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY Basic3Tier.Core/Basic3Tier.Core.csproj Basic3Tier.Core/
COPY Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj Basic3Tier.Infrastructure/
COPY Basic3TierAPI/Basic3TierAPI.csproj Basic3TierAPI/
COPY Tests/Basic3Tier.Core.Tests/Basic3Tier.Core.Tests.csproj Tests/Basic3Tier.Core.Tests/
COPY Tests/Basic3Tier.Infrastructure.Tests/Basic3Tier.Infrastructure.Tests.csproj Tests/Basic3Tier.Infrastructure.Tests/
COPY Tests/Basic3TierAPI.Tests/Basic3TierAPI.Tests.csproj Tests/Basic3TierAPI.Tests/

RUN dotnet restore Basic3TierAPI/Basic3TierAPI.csproj

COPY . .
RUN dotnet publish Basic3TierAPI/Basic3TierAPI.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]
