FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./SampleForLinux.sln" --disable-parallel
RUN dotnet publish "./SampleForLinux.sln" -c release -o /app --no-restore



FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5000

ENTRYPOINT ["dotnet", "SampleForLinux.dll"]

